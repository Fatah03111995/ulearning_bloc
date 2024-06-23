// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:ulearning_bloc/core/services/component_util.dart';

class UserConnection {
  static Future<int?> register({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (userName.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      ComponentUtil.toastErr('please fill all');
      return null;
    }
    if (password != confirmPassword) {
      ComponentUtil.toastErr('password and confirm password does not match');
      return null;
    }
    try {
      UserCredential response = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);
      if (response.user == null) {
        throw 'error : response.user = null';
      } else {
        await response.user?.sendEmailVerification().then((value) {
          ComponentUtil.toastInfo(
              'Please check your email, to verify your email address');
        });
        await response.user?.updateDisplayName(userName).then((value) => 1);
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          ComponentUtil.toastErr('Email already used !');
          break;
        case 'invalid-email':
          ComponentUtil.toastErr('Re check your email address');
          break;
        case 'weak-password':
          ComponentUtil.toastErr('your password is weak');
          break;
        default:
          ComponentUtil.toastErr('Re-check youe input and Try Again Later !');
      }
    } catch (e) {
      ComponentUtil.toastErr('error, try again later!');
    }
    return null;
  }

  static Future<void> loginByEmail(
      {required String email, required String password}) async {
    try {
      UserCredential credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      if (credential.user == null) {
        // do something if user == null
        ComponentUtil.toastErr('user null');
      }
      if (!credential.user!.emailVerified) {
        //do something if email not verified
        ComponentUtil.toastErr('email not verified');
      }

      User? user = credential.user;
      if (user != null) {
        // got verified user from firebase
        ComponentUtil.toastSuccess('Welcome ${user.displayName}!');
      } else {
        // error getting user from firebase
        ComponentUtil.toastErr('error after cecking email');
      }
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-not-found':
          ComponentUtil.toastErr('user not found');
        case 'wrong-password':
          ComponentUtil.toastErr('wrong password');
        default:
          ComponentUtil.toastErr('cek yourinput ');
      }
    } catch (e) {
      print(e);
    }
  }
}
