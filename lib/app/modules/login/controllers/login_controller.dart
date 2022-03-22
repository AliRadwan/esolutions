import 'package:esolutions/core/services/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginController extends GetxController {
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  late TextEditingController phoneController, passwordController;
  Auth auth = Auth();
  var phone = '';
  var password = '';
  var isloading = false.obs;

  late GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);
  var isSignIn = false.obs;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  @override
  void onInit() {
    phoneController = TextEditingController();
    passwordController = TextEditingController();
    super.onInit();
  }

  @override
  void onClose() {
    phoneController.dispose();
    passwordController.dispose();
  }

  String? validateEmail(String value) {
    // if (!GetUtils.isPhoneNumber(value)) {
    if (value.length < 6) {
      return 'Provide valid Email';
    }
    return null;
  }

  String? validatePassword(String value) {
    if (value.length < 6) {
      return 'Password must be of 6 characters';
    }
    return null;
  }

  void checkLogin() async {
    final isValid = loginFormKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    loginFormKey.currentState!.save();
    isloading.value = true;
    var data = await auth.login(email: phone, password: password);
    isloading.value = false;
    Get.snackbar('Success', data.success!.name!.toString(),
        icon: Icon(
          Icons.check,
          color: Colors.green,
        ),
        snackPosition: SnackPosition.BOTTOM);
  }

  void signInWithGoogleAccount() async {
    try {
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();
      GoogleSignInAuthentication _googleSignInAuthentication =
          await googleUser!.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        idToken: _googleSignInAuthentication.idToken,
        accessToken: _googleSignInAuthentication.accessToken,
      );
      await firebaseAuth.signInWithCredential(credential);
      Get.snackbar('Success', googleUser.email,
          snackPosition: SnackPosition.BOTTOM,
          icon: Icon(
            Icons.check,
            color: Colors.green,
          ));
    } catch (error) {
      print(error);
      String errorMessage =
          error.toString().substring(error.toString().indexOf(' ') + 1);
      Get.snackbar('Failed to login..', errorMessage,
          snackPosition: SnackPosition.BOTTOM);
    }
  }
}
