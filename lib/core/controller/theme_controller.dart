// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:support_ticket/config/theme/dark_theme.dart';
import 'package:support_ticket/config/theme/light_theme.dart';
import 'package:support_ticket/utils/colors.dart';
import 'package:support_ticket/utils/constant.dart';
import 'package:support_ticket/utils/prefer.dart';


class ThemeController extends GetxController {
  final scrollbarTheme = ScrollbarThemeData(
    thumbVisibility: MaterialStateProperty.all(true),
  );
  RxBool isDark = Prefs.getBool(AppConstant.isDarkUrl).obs;
  bool isDarkTheme = Prefs.getBool(AppConstant.isDarkUrl);

  ThemeData get theme => isDarkTheme
      ? ThemeData.dark().copyWith(
          scrollbarTheme: scrollbarTheme,
          primaryColor: AppColor.themeNavyBlueColor,
        )
      : ThemeData.light().copyWith(
          scrollbarTheme: scrollbarTheme,
          primaryColor: AppColor.themeNavyBlueColor,
        );

  void changeTheme(bool value) {
    Prefs.setBool(AppConstant.isDarkUrl, value);
    isDarkTheme = Prefs.getBool(AppConstant.isDarkUrl);
    print('isDarkTheme::: $isDarkTheme');

    if (isDarkTheme == false) {
      AppLightTheme.lightThemeColor();
      AppLightTheme.lightThemeImage();
      update();
    } else {
      AppDarkTheme.darkColor();
      AppDarkTheme.darkThemeImage();
      update();
    }
    update();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    changeTheme(isDarkTheme);
  }
}
