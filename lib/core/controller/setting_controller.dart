// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:support_ticket/config/repository/logout_repository.dart';
import 'package:support_ticket/core/model/login_response.dart';
import 'package:support_ticket/utils/constant.dart';
import 'package:support_ticket/utils/prefer.dart';
import 'package:support_ticket/view/screen/auth/login_screen.dart';
import 'package:support_ticket/view/widget/loading_widget.dart';
import '../../view/widget/common_snak_bar_widget.dart';
import 'auth_controller.dart';

class SettingController extends GetxController {
  LogoutRepository logoutRepository = LogoutRepository();
  RxString profileImage=''.obs;
  RxString name=''.obs;
  RxString email=''.obs;
  RxBool isDarkTheme = false.obs;
  // String defaultLanguageCode = Prefs.getString(AppConstant.LANGUAGE_CODE) == ''
  //     ? 'en'
  //     : Prefs.getString(AppConstant.LANGUAGE_CODE);
  RxBool isRtl = false.obs;
 RxString languageCode=defaultLanguageCode.obs;
  RxString workSpaceId = Prefs.getString(AppConstant.workSpaceId).toString().obs;
  RxInt selectedWorkSpaceId=0.obs;
  RxList<Workspace>  workSpaceList=<Workspace>[].obs;


  @override
  void onInit() {
    super.onInit();
    isRtl.value= languageCode.value == 'ar' ?true :false;
    profileImage.value=Prefs.getString(AppConstant.profileImage);
    name.value=Prefs.getString(AppConstant.userName);
    email.value=Prefs.getString(AppConstant.emailId);
  }


  updateLanguage(Locale locale) {
    Get.updateLocale(locale);
    Prefs.setString(AppConstant.LANGUAGE_CODE, locale.languageCode);
  }


  deleteUser() async {
    Loader.showLoader();
    var response = await logoutRepository.deleteUser();
    if (response['status'] == 1) {
      Prefs.clear();
      Get.deleteAll();
      Get.offAll(()=> LoginScreen());
      commonToast(response['message']);
    } else if (response['status'] == 0) {
      commonToast(response['message']);
    } else {
      commonToast(response['message']);
    }
    Loader.hideLoader();
  }

  logOutData() async {
    Loader.showLoader();
    var response = await logoutRepository.logOutFun();
    print("response--->$response");
    if (response['status'] == 1) {
      Prefs.clear();
      Get.deleteAll();

      Get.offAll(LoginScreen());
      commonToast(response['message']);
      Loader.hideLoader();
    } else if (response['status'] == 9) {
      Prefs.clear();
      Get.deleteAll();
      Get.offAll(() => LoginScreen());
      commonToast(response['message']);
    } else {
      commonToast(response['message']);
    }
  }
}
