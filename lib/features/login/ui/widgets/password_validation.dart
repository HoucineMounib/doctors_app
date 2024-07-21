import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:flutter/material.dart';

class PasswordValidation extends StatelessWidget {
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasSpecialCharacters;
  final bool hasMinLength;
  final bool hasNumber;

  const PasswordValidation({
    super.key,
    required this.hasLowerCase,
    required this.hasUpperCase,
    required this.hasSpecialCharacters,
    required this.hasMinLength,
    required this.hasNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        buildValidatorRow('At least 1 Lowercase letter', hasLowerCase),
        buildValidatorRow('At least 1 Uppercase letter', hasUpperCase),
        buildValidatorRow('At least 1 Number', hasNumber),
        buildValidatorRow(
            'At least 1 Special Characters', hasSpecialCharacters),
        buildValidatorRow('At least 8 letters', hasMinLength),
      ],
    );
  }
}

Widget buildValidatorRow(String text, bool hasValidated) {
  return Row(
    children: [
      const CircleAvatar(
        radius: 2.5,
        backgroundColor: ColorsManager.gray,
      ),
      horizontalSpace(6),
      Text(
        text,
        style: TextStyles.font13GrayRegular.copyWith(
            decoration: hasValidated ? TextDecoration.lineThrough : null,
            decorationColor: Colors.green,
            decorationThickness: 2,
            color: hasValidated ? Colors.green : ColorsManager.black),
      )
    ],
  );
}
