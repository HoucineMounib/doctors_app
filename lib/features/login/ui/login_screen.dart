import 'package:doctors_app/core/helpers/spacing.dart';
import 'package:doctors_app/core/theming/styles.dart';
import 'package:doctors_app/core/widgets/app_text_button.dart';
import 'package:doctors_app/features/login/data/models/login_request_body.dart';
import 'package:doctors_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctors_app/features/login/ui/widgets/email_and_password.dart';
import 'package:doctors_app/features/login/ui/widgets/go_to_sign_up_text.dart';
import 'package:doctors_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:doctors_app/features/login/ui/widgets/terms_and_conditions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
                "Welcome Back",
                style: TextStyles.font24BlueBold,
              ),
              verticalSpace(8),
              Text(
                "We're excited to have you back, can't wait to see what you've been up to since you last logged in.",
                style: TextStyles.font14GrayRegular.copyWith(height: 1.5),
              ),
              verticalSpace(40),
              EmailAndPassword(),
              verticalSpace(32),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Text(
                      'Forgot Password?',
                      style: TextStyles.font14BlueRegular,
                    ),
                  ),
                ],
              ),
              verticalSpace(40),
              AppTextButton(
                buttonText: 'Login',
                onPressed: () {
                  validateAndDoLogin(context);
                },
              ),
              verticalSpace(24),
              const TermsAndConfiotionsText(),
              verticalSpace(32),
              const Center(child: GoToSignUpText()),
              const LoginBlocListener()
            ],
          )),
        ),
      ),
    );
  }

  ///Send the Requaste after be sure I'm validated
  void validateAndDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }
}
