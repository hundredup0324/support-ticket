// ignore_for_file: must_be_immutable, prefer_const_constructors

import 'package:get/get.dart';
import 'package:support_ticket/view/screen/auth/change_password.dart';
import 'package:support_ticket/view/screen/workspace_screen.dart';
import 'edit_profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:support_ticket/utils/colors.dart';
import 'package:support_ticket/utils/images.dart';
import 'package:support_ticket/utils/text_style.dart';
import 'package:support_ticket/view/widget/icon_and_image.dart';
import 'package:support_ticket/core/controller/auth_controller.dart';
import 'package:support_ticket/view/widget/common_appbar_widget.dart';
import 'package:support_ticket/core/controller/theme_controller.dart';
import 'package:support_ticket/core/controller/setting_controller.dart';
import 'package:support_ticket/view/widget/common_space_divider_widget.dart';
import 'package:support_ticket/view/screen/setting_screen/store_theme_settings.dart';

class SettingScreen extends StatelessWidget {

  SettingScreen({super.key});

  SettingController settingController = Get.put(SettingController());
  AuthController authController = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
        init: ThemeController(),
        builder: (_) {
        return Scaffold(
          backgroundColor: AppColor.cBackGround,
          body: Column(
            children: [
              simpleAppBar( title: "Settings", isBack: false),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Obx(() {
                  if (settingController.languageCode.value == 'ar') {
                    settingController.isRtl.value = true;
                  } else {
                    settingController.isRtl.value = false;
                  }
                  print(settingController.isRtl.value);
                  return Column(
                    children: [
                      titleRowWidget(
                        icn: DefaultImages.userProfileIcn,
                        title: "Edit Profile",
                        onTap: () {
                          Get.to(() => EditProfileScreen());
                        },
                      ),
                      horizontalDivider(),

                      titleRowWidget(
                        icn: DefaultImages.themeIcn,
                        title: "Store Theme Settings",
                        onTap: () {
                          Get.to(() => StoreThemeSettingScreen());
                        },
                      ),
                      horizontalDivider(),

                      titleRowWidget(
                        icn: DefaultImages.rtlIcn,
                        title: "Workspace",
                        onTap: () {
                          Get.to(() => WorkSpaceScreen());
                        },
                      ),
                      horizontalDivider(),

                      titleRowWidget(
                        icn: DefaultImages.lockIcn,
                        title: "ChangePassword",
                        onTap: () {
                          Get.to(() => ChangePasswordScreen());
                        },
                      ),

                      horizontalDivider(),
                      titleRowWidget(
                        icn: DefaultImages.logoutIcn,
                        title: "Logout",
                        onTap: () {
                          settingController.logOutData();
                        },
                      ),
                      horizontalDivider(),
                    ],
                  );
                }),
              )
            ],
          ),
        );
      }
    );
  }

  titleRowWidget({
    required String icn,
    required String title,
    Function()? onTap,
    bool?isNext=true
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 45,
        color: AppColor.cBackGround,
        padding: EdgeInsets.only(right: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                assetSvdImageWidget(
                  image: icn,
                  height: 16,
                  width: 16,
                  colorFilter: ColorFilter.mode(
                    AppColor.cLabel,
                    BlendMode.srcIn,
                  ),
                ),
                horizontalSpace(10),
                Text(
                  title,
                  style: pSemiBold14,
                )
              ],
            ),
           isNext==false?SizedBox(): assetSvdImageWidget(image: DefaultImages.nextIcn,colorFilter: ColorFilter.mode(AppColor.cDarkGreyFont, BlendMode.srcIn,),),
          ],
        ),
      ),
    );
  }
}
