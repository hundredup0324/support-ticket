// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:support_ticket/core/controller/faq_controller.dart';
import 'package:support_ticket/core/model/faq_model.dart';
import 'package:support_ticket/utils/colors.dart';
import 'package:support_ticket/utils/constant.dart';
import 'package:support_ticket/utils/images.dart';
import 'package:support_ticket/utils/prefer.dart';
import 'package:support_ticket/utils/text_style.dart';
import 'package:support_ticket/view/widget/common_button.dart';
import 'package:support_ticket/view/widget/common_snak_bar_widget.dart';
import 'package:support_ticket/view/widget/icon_and_image.dart';
import 'package:support_ticket/view/widget/common_appbar_widget.dart';
import 'package:support_ticket/view/widget/common_space_divider_widget.dart';

class ManageFaqScreen extends StatefulWidget {
  const ManageFaqScreen({super.key});

  @override
  State<ManageFaqScreen> createState() => _ManageFaqScreenState();
}

class _ManageFaqScreenState extends State<ManageFaqScreen> {
  FaqController faqController = Get.put(FaqController());
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    faqController.faqList.clear();
    faqController.currantPage.value = 1;
    faqController.isScroll.value = true;
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      faqController.getFaqData(
          perPage: faqController.perPage.value,
          page: faqController.currantPage.value);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.cBackGround,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Obx(() {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "FAQ",
                      style: pRegular20,
                    ),
                  ],
                ),
                verticalSpace(14),
                faqController.faqList.isEmpty
                    ? Expanded(
                        child: Center(
                        child: Text(
                          "Data not found",
                          style: pRegular16.copyWith(
                              color: AppColor.cText),
                        ),
                      ))
                    : Expanded(
                        child: ListView.builder(
                          controller: scrollController,
                          itemCount: faqController.faqList.length,
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, index) {
                            FaqModelData faq = faqController.faqList[index];
                            return Column(

                              children: [
                                horizontalDivider(),
                                ExpansionTile(
                                  backgroundColor: AppColor.cBackGround,
                                  title: ListTile(

                                    title: Text(
                                      faq.title.toString().tr,
                                      style: pSemiBold16,
                                    ),

                                  ),

                                  childrenPadding: EdgeInsets.symmetric(
                                      horizontal: 16,),
                                  tilePadding: EdgeInsets.zero,
                                  iconColor: AppColor.cText,
                                  collapsedIconColor: AppColor.cText,
                                  shape: InputBorder.none,
                                  collapsedShape: InputBorder.none,
                                  children: [
                                    Text(
                                      faq.description.toString().tr,
                                      style: pRegular16,
                                    ),
                                  ],
                                ),
                                horizontalDivider(),

                              ],
                            );
                          },
                        ),
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
