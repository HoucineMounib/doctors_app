import 'package:doctors_app/core/helpers/extentions.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:doctors_app/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpLoading ||
          current is SignUpSuccess ||
          current is SignUpError,
      listener: (context, state) {
        state.whenOrNull(
          signUpLoadign: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.mainBlue,
                      ),
                    ));
          },
          signUpSuccess: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          signUpError: (error) {
            context.pop();
            showDialog(
                context: context,
                builder: (context) => Center(
                      child: AlertDialog(
                        icon: const Icon(Icons.error),
                        iconColor: Colors.red,
                        title: Text(error),
                        actions: [
                          TextButton(
                              onPressed: () {
                                context.pop();
                              },
                              child: const Text('Got it'))
                        ],
                      ),
                    ));
          },
        );
      },
      child: const SizedBox.shrink(),
    );
  }
}
