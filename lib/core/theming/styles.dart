import 'package:doctors_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  static TextStyle font32BlueBold = TextStyle(
      fontSize: 32.sp,
      color: ColorsManager.mainBlue,
      fontWeight: FontWeight.bold);

  static TextStyle font18BlackSemiBold = TextStyle(
      fontSize: 18.sp, color: ColorsManager.black, fontWeight: FontWeight.w500);

  static TextStyle font13GrayRegular = TextStyle(
      fontSize: 13.sp, color: ColorsManager.gray, fontWeight: FontWeight.w400);

  static TextStyle font16WhiteSemiBold = TextStyle(
      fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w500);
}
