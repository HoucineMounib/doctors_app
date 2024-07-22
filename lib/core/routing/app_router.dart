import 'package:doctors_app/core/di/dependancy_injection.dart';
import 'package:doctors_app/core/routing/routes.dart';
import 'package:doctors_app/features/home/home_screen.dart';
import 'package:doctors_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctors_app/features/login/ui/login_screen.dart';
import 'package:doctors_app/features/onboarding/onboarding_screen.dart';
import 'package:doctors_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:doctors_app/features/sign_up/ui/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      /// Onboarding and Start
      case Routes.onBoardign:
        return MaterialPageRoute(builder: (_) => const OnboardingScreen());

      /// Auth and Regestration Flow
      case Routes.login:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<LoginCubit>(),
                  child: const LoginScreen(),
                ));

      case Routes.signUp:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => getIt<SignUpCubit>(),
                  child: const SignUpScreen(),
                ));

      /// Home View
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text("this page not found for ${setting.name}"),
                  ),
                ));
    }
  }
}
