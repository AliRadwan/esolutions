import 'package:esolutions/app/modules/login/views/common/custom_button_social.dart';
import 'package:esolutions/app/modules/login/views/common/custom_text_field.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            body: SingleChildScrollView(
                keyboardDismissBehavior:
                    ScrollViewKeyboardDismissBehavior.onDrag,
                child: Form(
                  key: controller.loginFormKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Image.network('https://bit.ly/3otHHog'),
                        Text(
                          'Welcome to E-Solutions',
                          style: TextStyle(fontSize: 20, color: Colors.black87),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        CustomTextFormField(
                          keyboardType: TextInputType.phone,
                          hintText: 'Phone',
                          prefixIcon: Icons.phone,
                          onSavedFn: (value) {
                            controller.phone = value!;
                          },
                          validatorFn: (value) {
                            return controller.validateEmail(value!);
                          },
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        CustomTextFormField(
                          hintText: 'Password',
                          prefixIcon: Icons.lock,
                          obscureText: true,
                          keyboardType: TextInputType.visiblePassword,
                          validatorFn: (value) {
                            return controller.validatePassword(value!);
                          },
                          onSavedFn: (value) {
                            controller.password = value!;
                          },
                        ),
                        SizedBox(
                          height: 48,
                        ),
                        ConstrainedBox(
                          constraints:
                              BoxConstraints.tightFor(width: context.width),
                          child: Obx(
                            () => ElevatedButton(
                              style: ButtonStyle(
                                shape: MaterialStateProperty.all(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                backgroundColor: MaterialStateProperty.all(
                                    Colors.deepPurpleAccent),
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(14)),
                              ),
                              child: controller.isloading.value
                                  ? Center(
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation(Colors.grey),
                                      ),
                                    )
                                  : Text(
                                      'Login',
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.white),
                                    ),
                              onPressed: () {
                                controller.checkLogin();
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 48,
                        ),
                        CustomButtonSocial(
                          title: 'Sign In with Google',
                          image: 'google',
                          onPressedFn: () {
                            controller.signInWithGoogleAccount();
                          },
                        ),
                      ],
                    ),
                  ),
                ))));
  }
}
