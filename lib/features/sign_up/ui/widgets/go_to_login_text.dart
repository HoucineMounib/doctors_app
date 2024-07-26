import 'package:doctors_app/core/helpers/extentions.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GoToLoginText extends StatelessWidget {
  const GoToLoginText({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.pushNamed(Routes.login);
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        child: RichText(
          textAlign: TextAlign.center,
          text: TextSpan(children: [
            TextSpan(
                text: "Already have an account yet? ",
                style: TextStyles.font14BlackRegular),
            TextSpan(text: ' Sign In ', style: TextStyles.font14BlueSemiBold),
          ]),
        ),
      ),
    );
  }
}
