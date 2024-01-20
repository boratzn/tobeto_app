import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/models/user.dart';
import 'package:tobeto_app/utils/utils.dart';

class FirebaseAuthService {
  static FirebaseAuthService? _instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _databaseReference = FirebaseFirestore.instance;

  FirebaseAuth get auth => _auth;
  FirebaseFirestore get databaseReference => _databaseReference;

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

  Future<UserModel?> getUserData() async {
    User? currUser = _auth.currentUser;

    if (currUser != null) {
      var userDocs = await _databaseReference.collection("users").get();
      for (var user in userDocs.docs) {
        if (user.id == currUser.uid) {
          final data = user.data();
          return UserModel(
              firstName: data["firstName"], lastName: data["lastName"]);
        }
      }
      return null;
    } else {
      print('Kullanıcı oturum açmamış.');
      return null;
    }
  }

  void saveUserData(String userId, String firstName, String lastName) {
    _databaseReference.collection('users').doc(userId).set({
      'firstName': firstName,
      'lastName': lastName,
    });
  }

  signOut() {
    _auth.signOut();
  }
}
