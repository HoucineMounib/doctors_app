import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

//CTA Button Component

class AppTextButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  final Color? backgroundColor;
  final TextStyle? textStyle;
  final double? buttomWidth;
  final double? buttomHeight;

  const AppTextButton({
    super.key,
    this.backgroundColor,
    this.textStyle,
    this.buttomWidth,
    this.buttomHeight,
    required this.buttonText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(
                backgroundColor ?? ColorsManager.mainBlue),
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
            fixedSize: MaterialStateProperty.all(Size(
                buttomWidth?.w ?? double.maxFinite, buttomHeight?.h ?? 52.h)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ))),
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: textStyle ?? TextStyles.font16WhiteSemiBold,
        ));
  }
}
