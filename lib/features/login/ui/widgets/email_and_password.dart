import 'package:doctors_app/core/helpers/app_regex.dart';
import 'package:doctors_app/core/helpers/spacing.dart';

import 'package:doctors_app/core/widgets/app_text_form_field.dart';
import 'package:doctors_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctors_app/features/login/ui/widgets/password_validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EmailAndPassword extends StatefulWidget {
  EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObscureText = true;

  late TextEditingController passwordController;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasSpecialCharacters = false;
  bool hasMinLength = false;
  bool hasNumber = false;
  @override
  void initState() {
    setState(() {
      passwordController = context.read<LoginCubit>().passwordController;
      passwordControllerValidation();
    });
  }

  void passwordControllerValidation() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegex.hasLowerCase(passwordController.text);
        hasUpperCase = AppRegex.hasUpperCase(passwordController.text);
        hasMinLength = AppRegex.hasMinLength(passwordController.text);
        hasSpecialCharacters =
            AppRegex.hasSpecialCharacter(passwordController.text);
        hasNumber = AppRegex.hasNumber(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        key: context.read<LoginCubit>().formKey,
        child: Column(
          children: [
            AppTextFormField(
              hintText: 'Email',
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isEmailValid(value)) {
                  return 'Please enter a valid email';
                }
              },
              controller: context.read<LoginCubit>().emailController,
            ),
            verticalSpace(16),
            AppTextFormField(
              hintText: 'Password',
              isObscureText: isObscureText,
              controller: context.read<LoginCubit>().passwordController,
              validator: (value) {
                if (value == null ||
                    value.isEmpty ||
                    !AppRegex.isPasswordValid(value)) {
                  return 'Please enter a valid password';
                }
              },
              suffixIcon: IconButton(
                icon: Icon(
                    isObscureText ? Icons.visibility_off : Icons.visibility),
                onPressed: () {
                  setState(() {
                    isObscureText = !isObscureText;
                  });
                },
              ),
            ),
            verticalSpace(24),
            PasswordValidation(
              hasLowerCase: hasLowerCase,
              hasMinLength: hasMinLength,
              hasNumber: hasNumber,
              hasSpecialCharacters: hasSpecialCharacters,
              hasUpperCase: hasUpperCase,
            ),
          ],
        ));
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
