import 'package:flutter/material.dart';
import 'package:support_ticket/utils/text_style.dart';

import 'colors.dart';

InputDecoration dropDownDecoration= InputDecoration(
  hintStyle: pMedium12.copyWith(color: AppColor.cHintFont),
  contentPadding: EdgeInsets.only(left: 16, right: 16),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(26),
    borderSide: BorderSide(color: AppColor.cBorder),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(26),
    borderSide: BorderSide(color: AppColor.cBorder),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(26),
    borderSide: BorderSide(color: AppColor.cBorder),
  ),
  disabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(26),
    borderSide: BorderSide(color: AppColor.cBorder),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(26),
    borderSide: BorderSide(color: AppColor.themeGreenColor, width: 1),
  ),
);