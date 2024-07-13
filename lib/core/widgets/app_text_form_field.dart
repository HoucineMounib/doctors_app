import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextFormField extends StatelessWidget {
  final String? hintText;
  final Widget? suffixIcon;
  final bool? isObscureText;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final Color? backgroundColor;

  const AppTextFormField({
    super.key,
    this.suffixIcon,
    required this.hintText,
    this.isObscureText,
    this.focusedBorder,
    this.enabledBorder,
    this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: InputBorder.none,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 20.w),
        filled: true,
        fillColor: backgroundColor ?? ColorsManager.canvasGray,
        hintText: hintText,
        hintStyle: TextStyles.font14LighterGrayMedium,
        suffixIcon: suffixIcon,

        //When Focused or clicked
        focusedBorder: focusedBorder ??
            OutlineInputBorder(
              borderSide:
                  const BorderSide(color: ColorsManager.mainBlue, width: 1.4),
              borderRadius: BorderRadius.circular(16.0),
            ),

        // default view of  input Form field
        enabledBorder: enabledBorder ??
            OutlineInputBorder(
              borderSide: const BorderSide(
                  color: ColorsManager.moreLightGray, width: 1.2),
              borderRadius: BorderRadius.circular(16.0),
            ),
      ),
      obscureText: isObscureText ?? false,
      style: TextStyles.font14BlackMedium
          .copyWith(decoration: TextDecoration.none),
    );
  }
}
