import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:tobeto_app/models/user.dart';

class FirebaseAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseReference = FirebaseFirestore.instance;

  FirebaseAuth get auth => _auth;

  Future<User?> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential credential = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credential.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'weak-password':
          throw Exception('Şifreniz çok güçsüz');
        case 'email-already-in-use':
          throw Exception('Bu emaile ait bir hesap zaten var.');
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
      switch (e.code) {
        case 'invalid-email':
          throw Exception('Geçersiz email adresi.');
        case 'user-not-found':
          throw Exception('Kullanıcı bulunamadı!');
        case 'wrong-password':
          throw Exception('Şifre hatalı!');
      }
    }
    return null;
  }

  Future<UserModel?> getUserData() async {
    User? currUser = FirebaseAuth.instance.currentUser;

    if (currUser != null) {
      var userDocs = await databaseReference.collection("users").get();
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
    databaseReference.collection('users').doc(userId).set({
      'firstName': firstName,
      'lastName': lastName,
    });
  }

  signOut() {
    _auth.signOut();
  }
}
