import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:support_ticket/utils/colors.dart';
import 'package:support_ticket/utils/images.dart';
import 'package:support_ticket/utils/text_style.dart';
import 'package:support_ticket/view/widget/common_button.dart';
import 'package:support_ticket/view/widget/icon_and_image.dart';
import 'package:support_ticket/view/screen/auth/login_screen.dart';
import 'package:support_ticket/view/widget/common_space_divider_widget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cNavyBlueBackGround,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(26, 24, 26, 26),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  verticalSpace(55),
                  Center(child: Image.asset(DefaultImages.welcomeImage)),
                  Text(
                    "All tickets in one place ",
                    style: pMedium24.copyWith(
                        fontSize: 30, color: AppColor.cWhite),
                    textAlign: TextAlign.center,
                  ),
                  verticalSpace(18),
                  Text(
                    "A multi-tasking application for handling inquiries.",
                    style: pRegular16.copyWith(color: AppColor.cLightGrey),
                    // textAlign: TextAlign.center,
                  ),
                  verticalSpace(36),
                  CommonButton(
                    title: 'Login',
                    onPressed: () {
                      Get.offAll(() => LoginScreen());
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
