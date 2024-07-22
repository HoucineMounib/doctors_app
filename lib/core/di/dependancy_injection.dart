import 'package:dio/dio.dart';
import 'package:doctors_app/core/networking/api_service.dart';
import 'package:doctors_app/core/networking/dio_factory.dart';
import 'package:doctors_app/features/login/data/repos/login_repo.dart';
import 'package:doctors_app/features/login/logic/cubit/login_cubit.dart';
import 'package:doctors_app/features/sign_up/data/repo/sign_up_repo.dart';
import 'package:doctors_app/features/sign_up/logic/cubit/sign_up_cubit.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void SetupGetIt() {
  Dio dio = DioFactory.getDio();
//Dio & ApiServics
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));

  ///Login with there Cubit
  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt()));
  getIt.registerFactory<LoginCubit>(
      () => LoginCubit(getIt())); // registerFactory always for cubits

  ///Sign_Up with there Cubit
  getIt.registerLazySingleton<SignUpRepo>(() => SignUpRepo(getIt()));
  getIt.registerFactory<SignUpCubit>(
      () => SignUpCubit(getIt())); // registerFactory always for cubits
}
