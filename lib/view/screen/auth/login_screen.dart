// ignore_for_file: avoid_print, prefer_const_constructors_in_immutables
import 'dart:io';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:support_ticket/view/screen/dashboard_manager_screen/dashboard_manager_screen.dart';
import 'package:support_ticket/view/widget/common_space_divider_widget.dart';
import 'package:support_ticket/core/controller/auth_controller.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:support_ticket/utils/constant.dart';
import 'package:support_ticket/utils/colors.dart';
import 'package:support_ticket/utils/images.dart';
import 'package:support_ticket/utils/prefer.dart';
import 'package:support_ticket/utils/validator.dart';
import 'package:support_ticket/utils/text_style.dart';
import 'package:support_ticket/view/widget/common_button.dart';
import 'package:support_ticket/view/widget/icon_and_image.dart';
import 'package:support_ticket/view/widget/auth_text_field.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  AuthController authController = Get.put(AuthController());

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Prefs.getBool(AppConstant.isDemoMode) == true) {
      authController.emailController.text = 'admin@example.com';
      authController.passwordController.text = '1234';
    } else {
      authController.emailController.clear();
      authController.passwordController.clear();
    }
    if (Platform.isIOS) {
      FirebaseMessaging.instance.getAPNSToken().then((token) {
        authController.deviceToken.value = token!;
        authController.deviceType.value = Platform.operatingSystem;
      });
    } else {
      FirebaseMessaging.instance.getToken().then((token) {
        authController.deviceToken.value = token!;
        authController.deviceType.value = Platform.operatingSystem;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: AppColor.cNavyBlueBackGround,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Obx(() {
                  return Form(
                    key: formKey,
                    child: Expanded(
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: ListView(
                          shrinkWrap: true,

                          children: [
                            Center(child: Image.asset(DefaultImages.welcomeImage)),
                            Text(
                              "Login with Email".tr,
                              style: pMedium24.copyWith(color: AppColor.cWhite),
                              // textAlign: TextAlign.center,
                            ),
                            verticalSpace(8),
                            Text(
                              "Login now to access All tickets in one place".tr,
                              style: pRegular16.copyWith(
                                  color: AppColor.cLightGrey),
                              // textAlign: TextAlign.center,
                            ),
                            verticalSpace(35),
                            AuthTextField(
                              controller: authController.emailController,
                              labelText: 'Email address:',
                              hintText: "Enter Email".tr,
                              keyboardType: TextInputType.emailAddress,
                              prefix: DefaultImages.emailIcn,
                              onChanged: (value) {
                                Validator.validateEmail(value);
                              },
                              validator: (value) {
                                return Validator.validateEmail(value);
                              },
                            ),
                            verticalSpace(16),
                            AuthTextField(
                              controller: authController.passwordController,
                              labelText: "Password:",
                              hintText: "Enter Password".tr,
                              obscureText: authController.isObscure.value,
                              obscuringCharacter: "*",
                              prefix: DefaultImages.lockIcn,
                              onChanged: (value) {
                                Validator.validateRequired(value,
                                    string: "Password");
                              },
                              validator: (value) {
                                return Validator.validateRequired(value,
                                    string: "Password");
                              },
                              suffix: GestureDetector(
                                onTap: () {
                                  authController.isObscure.value =
                                      !authController.isObscure.value;
                                },
                                child: Icon(
                                  authController.isObscure.value
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: AppColor.cDarkGreyFont,
                                ),
                              ),
                            ),
                            verticalSpace(32),
                            CommonButton(
                              title: "Login",
                              onPressed: () {
                                if (Prefs.getBool(AppConstant.isDemoMode) ==
                                    true) {
                                  Get.offAll(() => DashBoardManagerScreen(
                                        currantIndex: 2,
                                      ));
                                } else {
                                  if (formKey.currentState!.validate()) {
                                    authController.authLogin(
                                        email: authController
                                            .emailController.text
                                            .trim(),
                                        password: authController
                                            .passwordController.text
                                            .trim(),
                                        deviceToken:
                                            authController.deviceToken.value,
                                        deviceType:
                                            authController.deviceType.value);
                                  }
                                }
                              },
                            ),
                            // verticalSpace(35),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
