// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';

class UserConnection {
  static Future<void> loginByEmail(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user == null) {
        // do something if user == null
        print('user null');
      }
      if (!credential.user!.emailVerified) {
        //do something if email not verified
        print('email not verified');
      }

      User? user = credential.user;
      if (user != null) {
        // got verified user from firebase
        print('get verified user');
      } else {
        // error getting user from firebase
        print('error after cecking email');
      }
    } on FirebaseAuthException catch (e) {
      switch (e.message) {
        case 'user-not-found':
          print('user not found');
        case 'wrong-password':
          print('wrong');
        default:
          print('cek yourinput ');
      }
    } catch (e) {
      print(e);
    }
  }
}
