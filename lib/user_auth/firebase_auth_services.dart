import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:path_provider/path_provider.dart';
import 'package:tobeto_app/constants/collection_names.dart';
import 'package:tobeto_app/models/exam.dart';
import 'package:tobeto_app/models/index.dart';
import 'package:tobeto_app/utils/utils.dart';
import 'package:path/path.dart';

class FirebaseAuthService {
  static FirebaseAuthService? _instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _databaseReference = FirebaseFirestore.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;

  FirebaseAuth get auth => _auth;
  FirebaseFirestore get databaseReference => _databaseReference;
  FirebaseStorage get storageInstance => _storage;

  FirebaseAuthService._internal();

  factory FirebaseAuthService() {
    _instance ??= FirebaseAuthService._internal();
    return _instance!;
  }

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast(message: "Zayıf Şifre");
      } else {
        showToast(message: "Bu emaile ait bir hesap zaten var.");
      }
    }
    return null;
  }

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    UserCredential uCredential = await _auth.signInWithCredential(credential);

    if (uCredential.additionalUserInfo!.isNewUser) {
      List<String> userName = uCredential.user!.displayName!.split(' ');
      if (userName.length == 2) {
        saveUserData(uCredential.user!.uid, userName[0], userName[1],
            uCredential.user!.email!);
      }
      if (userName.length == 3) {
        saveUserData(uCredential.user!.uid, userName[0] + userName[1],
            userName[2], uCredential.user!.email!);
      }
      if (userName.length == 4) {
        saveUserData(
            uCredential.user!.uid,
            userName[0] + userName[1] + userName[2],
            userName[3],
            uCredential.user!.email!);
      }
    }

    //await getUserData();

    return uCredential.user;
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' ||
          e.code == 'wrong-password' ||
          e.code == 'invalid-credential') {
        showToast(message: "Geçersiz Email ve ya Şifre!");
      } else {
        showToast(
            message:
                "Giriş yaparken hata oluştu. Email ve şifrenizi kontrol edin.");
      }
    }
    return null;
  }

  Future<void> resetPassword(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      showToast(message: "Mailinize şifre sıfırlama linki gönderildi.");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'invalid-email') {
        showToast(message: "Geçersiz E-Posta!");
      } else {
        showToast(message: "Kullanıcı Bulunamadı!");
      }
    }
  }

  Future<void> downloadPDF(Certificate certificate) async {
    try {
      // PDF dosyasını indirin
      var request = await HttpClient().getUrl(Uri.parse(certificate.url!));
      var response = await request.close();
      var bytes = await consolidateHttpClientResponseBytes(response);

      // Dosya sistemine kaydedin
      final downloadsDirectory = await getExternalStorageDirectory();
      final file = File('${downloadsDirectory!.path}/${certificate.name}');
      await file.writeAsBytes(bytes);

      // İndirme başarılı mesajı
      showToast(
          message: 'PDF dosyası başarıyla indirildi: ${certificate.name}');
    } catch (e) {
      // Hata durumunda mesajı yazdırın
      showToast(message: 'PDF dosyası indirilirken hata oluştu: $e');
    }
  }

  Future<void> uploadCertificate(File? file) async {
    if (file != null) {
      String fileName = basename(file.path);
      try {
        final storageRef = storageInstance
            .ref()
            .child('${Collections.CERTIFICATES}/${auth.currentUser!.uid}')
            .child(fileName);

        DocumentReference userDocRef = databaseReference
            .collection(Collections.USERS)
            .doc(auth.currentUser!.uid);

        DocumentSnapshot userDoc = await userDocRef.get();
        var certificates = userDoc['certificates'] ?? [];

        await storageRef.putFile(file);
        final url = await storageRef.getDownloadURL();

        // Yeni sertifika öğesini ekleyin
        var newCertificate = {
          'name': fileName,
          'url': url,
          'createdDate': FieldValue.serverTimestamp()
        };
        certificates.add(newCertificate);
        // Güncellenmiş sertifika dizisini Firestore'a geri yükleyin
        await userDocRef.update({'certificates': certificates});
      } catch (e) {
        showToast(message: "Hata Mesajı: $e");
      }
    }
  }

  Future<void> upload(File? file) async {
    final storageRef = storageInstance
        .ref()
        .child(Collections.IMAGES)
        .child("${auth.currentUser!.uid}.jpg");

    await storageRef.putFile(file!);
    final url = await storageRef.getDownloadURL();
    final document = databaseReference
        .collection(Collections.USERS)
        .doc(auth.currentUser!.uid);
    await document.update({'imageUrl': url});
  }

  void delete() async {
    final storageRef = storageInstance
        .ref()
        .child(Collections.IMAGES)
        .child("${auth.currentUser!.uid}.jpg");

    final document = databaseReference
        .collection(Collections.USERS)
        .doc(auth.currentUser!.uid);
    await document.update({'imageUrl': null});

    await storageRef.delete();
  }

  Future<List<Training>> getTrainingsByUid(String uid) async {
    List<Training> listTraining = [];
    try {
      // Firestore referansını al
      final CollectionReference trainingsCollection =
          databaseReference.collection(Collections.TRAININGS);

      // Koleksiyon içinde belirli bir uid'yi içeren belgeleri al
      QuerySnapshot querySnapshot =
          await trainingsCollection.where('users', arrayContains: uid).get();

      // Her bir belgeyi işle
      for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
        var data = documentSnapshot.data() as Map<String, dynamic>;
        Training training = Training.fromMap(data);
        listTraining.add(training);
      }

      return listTraining;
    } catch (e) {
      showToast(message: 'Hata: $e');
    }
    return <Training>[];
  }

  void updateUserInformation(UserModel user) async {
    try {
      final doc = databaseReference
          .collection(Collections.USERS)
          .doc(auth.currentUser!.uid);

      await doc.set({
        'firstName': user.firstName,
        'lastName': user.lastName,
        'email': user.email,
        'imageUrl': user.imageUrl,
        'id': user.id,
        'birthDate': user.birthDate,
        'country': user.country,
        'province': user.province,
        'distrinct': user.distrinct,
        'phoneNumber': user.phoneNumber,
        'neighborhood': user.neighborhood,
        'aboutMe': user.aboutMe
      }, SetOptions(merge: true));
      showToast(message: "Bilgiler başarıyla güncellendi.");
    } catch (e) {
      showToast(message: "Bilgiler güncellenirken bir hata oluştu!");
    }
  }

  void updateBusinessInformation(List<Business> business) async {
    try {
      final doc = databaseReference
          .collection(Collections.USERS)
          .doc(auth.currentUser!.uid);

      List<Map<String, dynamic>> businessList =
          List.generate(business.length, (index) {
        var item = business[index];
        return {
          'companyName': item.companyName,
          'position': item.position,
          'sector': item.sector,
          'province': item.province,
          'startDate': item.startDate,
          'endDate': item.endDate,
          'isWorking': item.isWorking,
          'workDescription': item.workDescription
        };
      });

      await doc.update({'business': FieldValue.arrayUnion(businessList)});

      showToast(message: "Bilgiler başarıyla güncellendi.");
    } catch (e) {
      showToast(message: "Bilgiler güncellenirken bir hata oluştu!");
    }
  }

  void updateEducationInformation(List<Education> education) async {
    try {
      final doc = databaseReference
          .collection(Collections.USERS)
          .doc(auth.currentUser!.uid);

      List<Map<String, dynamic>> educationList =
          List.generate(education.length, (index) {
        var item = education[index];
        return {
          'department': item.department,
          'educationState': item.educationState,
          'endDate': item.endDate,
          'isStudying': item.isStudying,
          'startDate': item.startDate,
          'university': item.university
        };
      });
      await doc.update({'education': FieldValue.arrayUnion(educationList)});
      showToast(message: "Bilgiler başarıyla güncellendi.");
    } catch (e) {
      showToast(message: "Bilgiler güncellenirken bir hata oluştu!");
    }
  }

  void updateSkillsInformation(List<Skill> skills) async {
    try {
      final doc = databaseReference
          .collection(Collections.USERS)
          .doc(auth.currentUser!.uid);

      List<Map<String, dynamic>> skillList =
          List.generate(skills.length, (index) {
        var item = skills[index];
        return {'skillName': item.skillName};
      });

      await doc.update({'skills': FieldValue.arrayUnion(skillList)});
      showToast(message: "Bilgiler başarıyla güncellendi.");
    } catch (e) {
      showToast(message: "Bilgiler güncellenirken bir hata oluştu!");
    }
  }

  void updateSocialMediaInformation(List<SocialMedia> socialMedias) async {
    try {
      final doc = databaseReference
          .collection(Collections.USERS)
          .doc(auth.currentUser!.uid);

      List<Map<String, dynamic>> smList =
          List.generate(socialMedias.length, (index) {
        var item = socialMedias[index];
        return {'name': item.name, 'url': item.url};
      });

      await doc.update({'socialMedia': FieldValue.arrayUnion(smList)});
      showToast(message: "Bilgiler başarıyla güncellendi1");
    } catch (e) {
      showToast(message: "Bilgiler güncellenirken bir hata oluştu!");
    }
  }

  void updateLanguagesInformation(List<Language> languages) async {
    try {
      final doc = databaseReference
          .collection(Collections.USERS)
          .doc(auth.currentUser!.uid);

      List<Map<String, dynamic>> languageList =
          List.generate(languages.length, (index) {
        var item = languages[index];
        return {'language': item.language, 'level': item.level};
      });

      await doc.update({'languages': FieldValue.arrayUnion(languageList)});
      showToast(message: "Bilgiler başarıyla güncellendi!");
    } catch (e) {
      showToast(message: "Bilgiler güncellenirken bir hata oluştu!");
    }
  }

  Future<void> changePassword(String newPassword, String oldPass) async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        await user.reauthenticateWithCredential(EmailAuthProvider.credential(
            email: user.email!, password: oldPass));
        await user.updatePassword(newPassword);
        showToast(message: "Şifre başarıyla değiştirildi.");
      } else {
        showToast(
            message: "Mevcut oturum açık değil veya kullanıcı bulunamadı.");
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        if (e.code == 'invalid-credential') {
          showToast(message: "Eski şifrenizi yanlış girdiniz!");
        }
      } else {
        showToast(message: "Şifre değiştirme işleminde hata oluştu: $e");
      }
    }
  }

  Future<void> deleteUserAndDocument() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        // Kullanıcının UID'sini al
        String userID = user.uid;
        // Firestore'daki users koleksiyonundan belgeyi sil
        await FirebaseFirestore.instance
            .collection(Collections.USERS)
            .doc(userID)
            .delete();

        // Storage'daki images altındaki kullanıcı resimlerini sil
        var storageReference = _storage.ref().child(Collections.IMAGES);
        var datas = await storageReference.list();

        for (var data in datas.items) {
          if (data.name == '${user.uid}.png') {
            await storageReference.delete();
          }
        }

        //Storage'daki certificates altındaki kullanıcı bilgilerini siler
        var referenceCertificates =
            _storage.ref().child(Collections.CERTIFICATES);
        var certificateDatas = await storageReference.list();

        for (var data in certificateDatas.items) {
          if (data.name == user.uid) {
            await referenceCertificates.delete();
          }
        }

        // Kullanıcıyı Firebase Authentication'dan sil
        await user.delete();

        showToast(message: "Üyelik Başarıyla sonlandırıldı.");
      } else {
        showToast(
            message: "Mevcut oturum açık değil veya kullanıcı bulunamadı.");
      }
    } catch (e) {
      showToast(message: "Hata oluştu: $e");
    }
  }

  Future<List<Exam>> getExamsByUid(String uid) async {
    User? user = _auth.currentUser;
    List<Exam> examList = [];
    try {
      if (user != null) {
        final CollectionReference examsCollection =
            databaseReference.collection(Collections.EXAMS);

        QuerySnapshot querySnapshot = await examsCollection.get();

        for (QueryDocumentSnapshot documentSnapshot in querySnapshot.docs) {
          if (documentSnapshot.exists) {
            var data = documentSnapshot.data() as Map<String, dynamic>;
            var userData = documentSnapshot.get('users') as List<dynamic>;

            userData.forEach((element) {
              if (element.containsKey('userID') && element['userID'] == uid) {
                Exam exam = Exam.fromMap(data);
                exam.isDone = element['isDone'];
                examList.add(exam);
              }
            });
          }
        }
        return examList;
      }
    } catch (e) {
      showToast(message: 'Hata: $e');
    }
    return <Exam>[];
  }

  Future<UserAllInfo?> getUserData() async {
    User? currUser = _auth.currentUser;

    if (currUser != null) {
      //*******************************USER INFO*********************** */
      var userDocs = await _databaseReference
          .collection(Collections.USERS)
          .doc(currUser.uid)
          .get();
      var userData = userDocs.data();
      UserModel userDataModel = UserModel.fromMap(userData!);

      var education = (userData['education'] as List<dynamic>?) ?? [];
      List<Education> educationData =
          education.map((e) => Education.fromMap(e)).toList();

      var business = (userData['business'] as List<dynamic>?) ?? [];
      List<Business> businessData =
          business.map((e) => Business.fromMap(e)).toList();

      var languages = (userData['languages'] as List<dynamic>?) ?? [];
      List<Language> languagesData =
          languages.map((e) => Language.fromMap(e)).toList();

      var certificates = (userData['certificates'] as List<dynamic>?) ?? [];
      List<Certificate> certificatesData =
          certificates.map((e) => Certificate.fromMap(e)).toList();

      var skills = (userData['skills'] as List<dynamic>?) ?? [];
      List<Skill> skillsData = skills.map((e) => Skill.fromMap(e)).toList();

      var socialMedia = (userData['socialMedia'] as List<dynamic>?) ?? [];
      List<SocialMedia> socialMediaData =
          socialMedia.map((e) => SocialMedia.fromMap(e)).toList();

      var trainings = await getTrainingsByUid(currUser.uid);
      var exams = await getExamsByUid(currUser.uid);

      UserAllInfo userModel = UserAllInfo(user: userDataModel);
      userModel.business = businessData;
      userModel.education = educationData;
      userModel.certificates = certificatesData;
      userModel.languages = languagesData;
      userModel.skills = skillsData;
      userModel.socialMedias = socialMediaData;
      userModel.trainings = trainings;
      userModel.exams = exams;

      return userModel;
    } else {
      showToast(message: 'Kullanıcı oturum açmamış.');
      return null;
    }
  }

  void saveUserData(
      String userId, String firstName, String lastName, String email) {
    _databaseReference.collection(Collections.USERS).doc(userId).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'business': [],
      'certificates': [],
      'education': [],
      'languages': [],
      'skills': [],
      'socialMedia': []
    });
  }

  Future<void> deleteBusinessInfoByIndex(int index) async {
    try {
      // Kullanıcının iş bilgilerini al
      var userRef = databaseReference
          .collection(Collections.USERS)
          .doc(_auth.currentUser!.uid);
      var userData = await userRef.get();
      var businessList = List.from(userData['business']);

      // Belirli index'teki iş bilgisini diziden kaldır
      if (index >= 0 && index < businessList.length) {
        businessList.removeAt(index);

        // Güncellenmiş iş bilgilerini belgeye ata
        await userRef.update({'business': businessList});

        showToast(message: 'İş bilgisi başarıyla silindi.');
      } else {
        showToast(message: 'Geçersiz index: $index');
      }
    } catch (e) {
      showToast(message: 'İş bilgisi silinirken hata oluştu: $e');
    }
  }

  Future<void> deleteEducationInfoById(int index) async {
    try {
      // Kullanıcının eğitim bilgilerini al
      var userRef = databaseReference
          .collection(Collections.USERS)
          .doc(_auth.currentUser!.uid);
      var userData = await userRef.get();
      var educationList = List.from(userData['education']);

      // Belirli index'teki eğitim bilgisini diziden kaldır
      if (index >= 0 && index < educationList.length) {
        educationList.removeAt(index);

        // Güncellenmiş eğitim bilgilerini belgeye ata
        await userRef.update({'education': educationList});

        showToast(message: 'Eğitim bilgisi başarıyla silindi.');
      } else {
        showToast(message: 'Geçersiz index: $index');
      }
    } catch (e) {
      showToast(message: 'Eğitim bilgisi silinirken hata oluştu: $e');
    }
  }

  Future<void> deleteSkillInfoById(int index) async {
    try {
      // Kullanıcının yetenek bilgilerini al
      var userRef = databaseReference
          .collection(Collections.USERS)
          .doc(_auth.currentUser!.uid);
      var userData = await userRef.get();
      var skillsList = List.from(userData['skills']);

      // Belirli index'teki yetenek bilgisini diziden kaldır
      if (index >= 0 && index < skillsList.length) {
        skillsList.removeAt(index);

        // Güncellenmiş yetenek bilgilerini belgeye ata
        await userRef.update({'skills': skillsList});

        showToast(message: 'Yetenek bilgisi başarıyla silindi.');
      } else {
        showToast(message: 'Geçersiz index: $index');
      }
    } catch (e) {
      showToast(message: 'Yetenek bilgisi silinirken hata oluştu: $e');
    }
  }

  Future<void> deleteSocialMediaInfoById(int index) async {
    try {
      // Kullanıcının sm bilgilerini al
      var userRef = databaseReference
          .collection(Collections.USERS)
          .doc(_auth.currentUser!.uid);
      var userData = await userRef.get();
      var skillsList = List.from(userData['socialMedia']);

      // Belirli index'teki sm bilgisini diziden kaldır
      if (index >= 0 && index < skillsList.length) {
        skillsList.removeAt(index);

        // Güncellenmiş sm bilgilerini belgeye ata
        await userRef.update({'socialMedia': skillsList});

        showToast(message: 'Sosyal Medya bilgisi başarıyla silindi.');
      } else {
        showToast(message: 'Geçersiz index: $index');
      }
    } catch (e) {
      showToast(message: 'Sosyla Medya bilgisi silinirken hata oluştu: $e');
    }
  }

  Future<void> deleteLanguageInfoById(int index) async {
    try {
      // Kullanıcının dil bilgilerini al
      var userRef = databaseReference
          .collection(Collections.USERS)
          .doc(_auth.currentUser!.uid);
      var userData = await userRef.get();
      var languageList = List.from(userData['languages']);

      // Belirli index'teki dil bilgisini diziden kaldır
      if (index >= 0 && index < languageList.length) {
        languageList.removeAt(index);

        // Güncellenmiş dil bilgilerini belgeye ata
        await userRef.update({'languages': languageList});

        showToast(message: 'Dil bilgisi başarıyla silindi.');
      } else {
        showToast(message: 'Geçersiz index: $index');
      }
    } catch (e) {
      showToast(message: 'Dil bilgisi silinirken hata oluştu: $e');
    }
  }

  Future<void> updateSocialMediaInfoById(int index, SocialMedia sm) async {
    try {
      // Kullanıcının sm bilgilerini al
      var userRef = databaseReference
          .collection(Collections.USERS)
          .doc(_auth.currentUser!.uid);
      var userData = await userRef.get();
      var smList = List.from(userData['socialMedia']);

      // Belirli index'teki sm bilgisini diziden kaldır
      if (index >= 0 && index < smList.length) {
        smList[index] = {'name': sm.name, 'url': sm.url};

        // Güncellenmiş sm bilgilerini belgeye ata
        await userRef.update({'socialMedia': smList});
      } else {
        showToast(message: 'Geçersiz index: $index');
      }
    } catch (e) {
      showToast(message: '${sm.name} bilgisi silinirken hata oluştu: $e');
    }
  }

  signOut() async {
    await _auth.signOut();
  }
}
