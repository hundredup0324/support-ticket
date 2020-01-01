import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:support_ticket/core/controller/setting_controller.dart';
import 'package:support_ticket/core/model/login_response.dart';
import 'package:support_ticket/utils/colors.dart';
import 'package:support_ticket/utils/constant.dart';
import 'package:support_ticket/utils/prefer.dart';
import 'package:support_ticket/utils/text_style.dart';
import 'package:support_ticket/view/widget/common_appbar_widget.dart';
import 'package:support_ticket/view/widget/common_button.dart';
import 'package:support_ticket/view/widget/common_snak_bar_widget.dart';

class WorkSpaceScreen extends StatelessWidget
{
  const WorkSpaceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SettingController settingController =Get.put(SettingController());

    var jsonList = jsonDecode(Prefs.getString(AppConstant.workSpaceArray));
    var workSpaceList = jsonList.map((json) => Workspace.fromJson(json)).toList();

    return Scaffold(
      backgroundColor: AppColor.cBackGround,
      appBar: simpleAppBar(title: "WorkSpace"),
      body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Padding(
                padding: const EdgeInsets.all(14),
                child: ListView.builder(
                    itemCount: workSpaceList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      var data = workSpaceList[index];

                      return Obx(() {
                        return GestureDetector(
                            onTap: () {
                              settingController.selectedWorkSpaceId.value = index;
                              settingController.workSpaceId.value = data.id.toString();
                              settingController.selectedWorkSpaceId.refresh();
                            },
                            child: workSpaceWidget(
                              title: data.name,
                              color: data.id.toString() ==
                                  settingController.workSpaceId.value
                                  ? AppColor.themeGreenColor
                                  : AppColor.cWhite,
                              bColor: data.id.toString() ==
                                  settingController.workSpaceId.value
                                  ? AppColor.themeGreenColor
                                  : AppColor.cBorder,
                            ));
                      });
                    }),
              )),
              Padding(
                padding: const EdgeInsets.all(16),
                child: CommonButton(
                  onPressed: () {
                    if (Prefs.getBool(AppConstant.isDemoMode) == true) {
                      commonToast(AppConstant.demoString);
                    } else {
                      Prefs.setString(AppConstant.workSpaceId, settingController.workSpaceId.value);
                      Get.back();
                    }
                  },
                  title: "Save",
                ),
              )
            ],
          )),
    );
  }


  Widget workSpaceWidget({String? title, Color? color, Color? bColor}) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: Container(
        height: 55,
        width: Get.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: bColor ?? AppColor.cBorder)),
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  title!,
                  style: pMedium14,
                ),
              ],
            ),
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                  border:
                  Border.all(color: bColor ?? AppColor.cBorder, width: 1),
                  shape: BoxShape.circle),
              padding: const EdgeInsets.all(01.5),
              child: CircleAvatar(
                backgroundColor: color ?? AppColor.cBackGround,
              ),
            ),
          ],
        ),
      ),
    );
  }

}