import 'package:animoo_app/core/api/dio_services.dart';
import 'package:animoo_app/features/auth/login/repo/login_repositiory_imp.dart';
import 'package:animoo_app/features/auth/login/repo/login_repository.dart';
import 'package:animoo_app/features/auth/login/view_model/forget_password_view_model.dart';
import 'package:animoo_app/features/auth/signUp/repo/signup_repository.dart';
import 'package:animoo_app/features/auth/signUp/repo/signup_repository_impl.dart';
import 'package:animoo_app/features/auth/signUp/view_models/otp_viewmodel.dart';
import 'package:animoo_app/features/auth/signUp/view_models/signup_viewmodel.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton(() => DioServices(dio: sl()));
  sl.registerLazySingleton<LoginRepository>(() => LoginRepositioryImp(sl()));
  sl.registerLazySingleton<SignupRepository>(() => SignupRepositoryImpl(sl()));

  sl.registerFactory(() => SignupViewmodel(sl()));

  sl.registerFactory(() => ForgetPasswordViewModel(sl()));
  sl.registerFactory(() => OtpViewmodel(sl()));
}