// ignore_for_file: prefer_const_constructors_in_immutables, avoid_print

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:support_ticket/utils/colors.dart';
import 'package:support_ticket/utils/constant.dart';
import 'package:support_ticket/utils/prefer.dart';
import 'package:support_ticket/view/widget/common_snak_bar_widget.dart';
import 'package:support_ticket/view/widget/custom_bottom_nav_bar/bar_item.dart';
import 'package:support_ticket/core/controller/dashboard_manager_controller.dart';
import 'package:support_ticket/view/widget/custom_bottom_nav_bar/custom_bottom_nav_bar.dart';

class DashBoardManagerScreen extends StatefulWidget {
  final int currantIndex;

  DashBoardManagerScreen({Key? key, this.currantIndex = 2}) : super(key: key);

  @override
  State<DashBoardManagerScreen> createState() => _DashBoardManagerScreenState();
}

class _DashBoardManagerScreenState extends State<DashBoardManagerScreen> {
  DashBoardManagerController dashboardManagerController = Get.put(DashBoardManagerController());

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      dashboardManagerController.currantIndex.value = widget.currantIndex;
      print("-------->${dashboardManagerController.currantIndex.value}");
      print("-------->${Prefs.getUserID()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: AppColor.cBackGround,
        body: SafeArea(
            bottom: false,
            child: dashboardManagerController.itemList[dashboardManagerController.currantIndex.value]['screen']),
        bottomNavigationBar: CustomConvexAppBar(
          backgroundColor: AppColor.cBottomNavyBlueColor,
          color: AppColor.cDarkGreyFont,
          activeColor: AppColor.cWhite,
          height: 65,
          style: TabStyle.fixedCircle,
          top: -35,
          curve: Curves.easeOut,
          initialActiveIndex: dashboardManagerController.currantIndex.value,
          disableDefaultTabController: false,
          items: dashboardManagerController.itemList.map((element) {
            return CustomTabItem(icon: element['icon'], title: element['title']);
          }).toList(),
          onTap: (index) {
            dashboardManagerController.currantIndex.value = index;
            print('click index=$index');
          },
        ),
      );
    });
  }
}
