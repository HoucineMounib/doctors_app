import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:doctors_app/features/sign_up/ui/widgets/go_to_login_text.dart';
import 'package:doctors_app/features/sign_up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:doctors_app/features/sign_up/ui/widgets/sign_up_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 30.w),
          child: SingleChildScrollView(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Create Account",
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                "Sign up now and start exploring all that our app has to offer. We're excited to welcome you to our community!.",
                style: TextStyles.font14GrayRegular.copyWith(height: 1.5),
              ),
              verticalSpace(24),
              const SignUpForm(),
              verticalSpace(40),
              AppTextButton(
                buttonText: 'Create Account',
                onPressed: () {
                  validateAndDoSignUp(context);
                },
              ),
              verticalSpace(8),
              const Center(child: GoToLoginText()),
              const SignUpBlocListener()
            ],
          )),
        ),
      ),
    );
  }

  ///Send the Requaste after be sure I'm validated
  void validateAndDoSignUp(BuildContext context) {
    if (context.read<SignUpCubit>().formKey.currentState!.validate()) {
      context.read<SignUpCubit>().emitSignUpStates();
    }
  }
}
