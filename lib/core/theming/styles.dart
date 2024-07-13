import 'package:doctors_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TextStyles {
  //Font Styles
  static TextStyle font32BlueBold = TextStyle(
      fontSize: 32.sp,
      color: ColorsManager.mainBlue,
      fontWeight: FontWeight.w700);

  static TextStyle font24BlueBold = TextStyle(
      fontSize: 24.sp,
      color: ColorsManager.mainBlue,
      fontWeight: FontWeight.w700);

  static TextStyle font18BlackSemiBold = TextStyle(
      fontSize: 18.sp, color: ColorsManager.black, fontWeight: FontWeight.w600);

  static TextStyle font14LighterGrayMedium = TextStyle(
      fontSize: 14.sp,
      color: ColorsManager.lighterGray,
      fontWeight: FontWeight.w500);

  static TextStyle font14BlackMedium = TextStyle(
      fontSize: 14.sp, color: ColorsManager.black, fontWeight: FontWeight.w500);

  static TextStyle font14lighterGrayRegular = TextStyle(
      fontSize: 14.sp,
      color: ColorsManager.lighterGray,
      fontWeight: FontWeight.w400);

  static TextStyle font14BlackRegular = TextStyle(
      fontSize: 14.sp, color: ColorsManager.black, fontWeight: FontWeight.w400);

  static TextStyle font13GrayRegular = TextStyle(
      fontSize: 13.sp, color: ColorsManager.gray, fontWeight: FontWeight.w400);
  static TextStyle font14BlueRegular = TextStyle(
      fontSize: 14.sp,
      color: ColorsManager.mainBlue,
      fontWeight: FontWeight.w400);
  static TextStyle font14BlueSemiBold = TextStyle(
      fontSize: 14.sp,
      color: ColorsManager.mainBlue,
      fontWeight: FontWeight.w600);

  static TextStyle font14GrayRegular = TextStyle(
      fontSize: 14.sp, color: ColorsManager.gray, fontWeight: FontWeight.w400);

  static TextStyle font16WhiteSemiBold = TextStyle(
      fontSize: 16.sp, color: Colors.white, fontWeight: FontWeight.w600);
}
