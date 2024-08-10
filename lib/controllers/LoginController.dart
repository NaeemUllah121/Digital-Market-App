
import 'package:digital_market/models/LoginModel.dart';
import 'package:digital_market/models/set_user_data.dart';
import 'package:digital_market/store/local_store.dart';
import 'package:digital_market/utill/helpers.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../views/Home/home_navbar.dart';
import '../views/StartUp/startup_pages.dart';

class LoginController extends GetxController with StateMixin<LoginModel> {
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;
  RxBool isLoading = false.obs;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  SetUserData? setUserData;
  final GetStorage box = GetStorage();

  Future<void> login() async {
    final email = emailController.value.text;
    final password = passwordController.value.text;
    try {
      isLoading(true).obs;
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      User? user = userCredential.user!;
      if (user.emailVerified) {
        await LocalStore.setLoginStatus(true);
        Get.to(const StartupPage(),
            duration: const Duration(seconds: 1), transition: Transition.zoom);
      } else {
        errorSnackbar('Verify your email');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'wrong-password') {
        print('Error logging in: $e');
        errorSnackbar('Wrong Password');
      } else if (e.code == 'user-not-found') {
        print('Error logging in: $e');
        errorSnackbar('The Email does not exist');
      } else if (e.code == 'invalid-email') {
        print('Error logging in: $e');
        errorSnackbar('the email is not valid');
      } else {
        print('Error logging in: $e');
        errorSnackbar('Login failed: $e');
      }
    } catch (e) {
      print('Error logging in: $e');
      errorSnackbar('Login failed: $e');
    } finally {
      isLoading(false).obs;
    }
  }

  Future<void> resetPassword() async {
    try {
      isLoading(true).obs;
      await _auth.sendPasswordResetEmail(
          email: emailController.value.text);
      successSnackbar('Password reset email sent. Check your email inbox.');
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('Error resetting password: $e');
        errorSnackbar('No user found with this email.');
      } else {
        print('Error resetting password: $e');
        errorSnackbar('Failed to reset password: $e');
      }
    } catch (e) {
      print('Error resetting password: $e');
      errorSnackbar('Failed to reset password: $e');
    } finally {
      isLoading(false).obs;
    }
  }

  Future<void> handleSignIn(BuildContext context) async {
    isLoading(true).obs;
    try {
      final GoogleSignInAccount? googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );
      UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      User user = userCredential.user!;
      String? userName = user.displayName;
      print("user$userName");
      await LocalStore.saveLoginDetails(
          number: user.email!, name: user.displayName!);
      await LocalStore.setLoginStatus(true);
      isLoading(false).obs;
      Get.offAll(const HomeNavbar());
    } catch (error) {
      print('Error signing in with Google: $error');
    } finally {
      isLoading(false).obs;
    }
  }
}
