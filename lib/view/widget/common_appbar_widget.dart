// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:support_ticket/utils/colors.dart';
import 'package:support_ticket/utils/helper.dart';
import 'package:support_ticket/utils/images.dart';
import 'package:support_ticket/utils/text_style.dart';
import 'package:support_ticket/view/widget/common_space_divider_widget.dart';
import 'package:support_ticket/view/widget/icon_and_image.dart';

simpleAppBar({bool isBack = true, required String title}) {
  return PreferredSize(
    preferredSize: Size(Get.width, 70),
    child: SafeArea(
      child: Padding(
        padding: EdgeInsets.only(top: 10, left: 15, right: 15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                isBack == true
                    ? GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Container(
                          height: 43,
                          width: 43,
                          decoration: BoxDecoration(
                            border: Border.all(color: AppColor.cBorder),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Align(
                            child: assetSvdImageWidget(
                                image: DefaultImages.backIcn,
                                width: 11,
                                height: 10,
                                colorFilter: ColorFilter.mode(
                                    AppColor.cLabel, BlendMode.srcIn)),
                          ),
                        ),
                      )
                    : SizedBox(),
                horizontalSpace(isBack == true ? 15 : 0),
                Text(
                  title,
                  style: pMedium16,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
