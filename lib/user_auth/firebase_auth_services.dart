import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:tobeto_app/constants/collection_names.dart';
import 'package:tobeto_app/models/business.dart';
import 'package:tobeto_app/models/certificate.dart';
import 'package:tobeto_app/models/education.dart';
import 'package:tobeto_app/models/language.dart';
import 'package:tobeto_app/models/skill.dart';
import 'package:tobeto_app/models/social_media.dart';
import 'package:tobeto_app/models/user.dart';
import 'package:tobeto_app/models/user_all_info.dart';
import 'package:tobeto_app/utils/utils.dart';

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

  void updateUserInformation(UserModel user) async {
    final doc = databaseReference
        .collection(Collections.USERS)
        .doc(auth.currentUser!.uid);

    await doc.update({
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
    });
  }

  void updateBusinessInformation(Business business) async {
    final doc = databaseReference
        .collection(Collections.USERS)
        .doc(auth.currentUser!.uid);

    await doc.update({
      'business': {
        'companyName': business.companyName,
        'position': business.position,
        'sector': business.sector,
        'province': business.province,
        'startDate': business.startDate,
        'endDate': business.endDate,
        'isWorking': business.isWorking,
        'workDescription': business.workDescription
      }
    });
  }

  void updateEducationInformation(Education education) async {
    final doc = databaseReference
        .collection(Collections.USERS)
        .doc(auth.currentUser!.uid);

    await doc.update({
      'education': {
        'department': education.department,
        'educationState': education.educationState,
        'endDate': education.endDate,
        'isStudying': education.isStudying,
        'startDate': education.startDate,
        'university': education.university
      }
    });
  }

  void updateSkillsInformation(List<Skill> skills) async {
    final doc = databaseReference
        .collection(Collections.USERS)
        .doc(auth.currentUser!.uid);

    List<Map<String, dynamic>> skillList =
        List.generate(skills.length, (index) {
      var item = skills[index];
      return {'name': item.skillName};
    });

    await doc.update({'skills': FieldValue.arrayUnion(skillList)});
  }

  void updateSocialMediaInformation(List<SocialMedia> socialMedias) async {
    final doc = databaseReference
        .collection(Collections.USERS)
        .doc(auth.currentUser!.uid);

    List<Map<String, dynamic>> smList =
        List.generate(socialMedias.length, (index) {
      var item = socialMedias[index];
      return {'name': item.name, 'url': item.url};
    });

    await doc.update({'socialMedia': FieldValue.arrayUnion(smList)});
  }

  void updateLanguagesInformation(List<Language> languages) async {
    final doc = databaseReference
        .collection(Collections.USERS)
        .doc(auth.currentUser!.uid);

    List<Map<String, dynamic>> languageList =
        List.generate(languages.length, (index) {
      var item = languages[index];
      return {'language': item.language, 'level': item.level};
    });

    await doc.update({'languages': FieldValue.arrayUnion(languageList)});
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

      var education = userData['education'] ?? "";
      Education educationData = Education.fromMap(education);

      var business = userData['business'] ?? "";
      Business businessData = Business.fromMap(business);

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

      UserAllInfo userModel = UserAllInfo(user: userDataModel);
      userModel.business = businessData;
      userModel.education = educationData;
      userModel.certificates = certificatesData;
      userModel.languages = languagesData;
      userModel.skills = skillsData;
      userModel.socialMedias = socialMediaData;

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
      'business': {},
      'certificates': [],
      'education': {},
      'languages': [],
      'skills': [],
      'socialMedia': []
    });
  }

  signOut() {
    _auth.signOut();
  }
}
