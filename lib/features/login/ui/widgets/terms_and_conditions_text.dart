import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class TermsAndConfiotionsText extends StatelessWidget {
  const TermsAndConfiotionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: [
        TextSpan(
            text: 'By logging, you agree to our ',
            style: TextStyles.font14lighterGrayRegular),
        TextSpan(
            text: ' Terms & Conditions ', style: TextStyles.font14BlackMedium),
        TextSpan(text: 'and ', style: TextStyles.font14lighterGrayRegular),
        TextSpan(
            text: ' PrivacyPolicy.',
            style: TextStyles.font14BlackMedium.copyWith(height: 1.5))
      ]),
    );
  }
}
