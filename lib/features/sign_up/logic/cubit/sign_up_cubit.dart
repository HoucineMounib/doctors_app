import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:doctors_app/features/sign_up/data/models/sign_up_reponse.dart';
import 'package:doctors_app/features/sign_up/data/models/sign_up_request_body.dart';
import 'package:doctors_app/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:doctors_app/features/sign_up/logic/cubit/sign_up_state.dart';
import 'package:flutter/material.dart';

class SignUpCubit extends Cubit<SignUpState> {
  final SignUpRepo _signUpRepo;
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());

  final formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfirmationController =
      TextEditingController();

  void emitSignUpStates() async {
    emit(const SignUpState.signUpLoadign());

    final response = await _signUpRepo.signUp(SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        password: passwordController.text,
        passwordConfirmation: passwordConfirmationController.text,
        gender: 0));

    response.when(seccess: (SignUpResponse signUpResponse) {
      emit(SignUpState.signUpSuccess(signUpResponse));
    }, failure: (error) {
      emit(SignUpState.signUpError(error: error.apiErrorModel.message ?? ''));
    });
  }
}
