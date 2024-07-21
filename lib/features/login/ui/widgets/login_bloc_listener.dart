import 'package:doctors_app/core/helpers/extentions.dart';
import 'package:doctors_app/core/networking/api_error_handler.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/core/theming/colors.dart';
import 'package:doctors_app/features/login/data/models/login_response.dart';
import 'package:doctors_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctors_app/features/login/logic/cubit/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Error,
      listener: (context, state) {
        state.whenOrNull(
          loading: () {
            showDialog(
                context: context,
                builder: (context) => const Center(
                      child: CircularProgressIndicator(
                        color: ColorsManager.mainBlue,
                      ),
                    ));
          },
          success: (loginResponse) {
            context.pop();
            context.pushNamed(Routes.homeScreen);
          },
          error: (error) {
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
