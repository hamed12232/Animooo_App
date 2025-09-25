import 'package:animoo_app/core/database/api/dio_services.dart';
import 'package:animoo_app/features/animal/repo/animal_repositiory.dart';
import 'package:animoo_app/features/animal/repo/animal_repositiory_imp.dart';
import 'package:animoo_app/features/animal/view_model/cubit/create_animal_cubit.dart';
import 'package:animoo_app/features/auth/login/repo/login_repositiory_imp.dart';
import 'package:animoo_app/features/auth/login/repo/login_repository.dart';
import 'package:animoo_app/features/auth/login/view_model/forget_password_view_model.dart';
import 'package:animoo_app/features/auth/login/view_model/login_view_model.dart';
import 'package:animoo_app/features/auth/signUp/repo/signup_repository.dart';
import 'package:animoo_app/features/auth/signUp/repo/signup_repository_impl.dart';
import 'package:animoo_app/features/auth/signUp/view_models/otp_viewmodel.dart';
import 'package:animoo_app/features/auth/signUp/view_models/signup_viewmodel.dart';
import 'package:animoo_app/features/category/repo/category_repositiory.dart';
import 'package:animoo_app/features/category/repo/category_repositiory_imp.dart';
import 'package:animoo_app/features/category/view_model/create_category/create_category_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

void setup() {
  sl.registerLazySingleton(() => Dio());
  sl.registerLazySingleton<DioServices>(() => DioServices(dio: sl()));
  sl.registerLazySingleton<LoginRepository>(
    () => LoginRepositioryImp(sl<DioServices>()),
  );
  sl.registerLazySingleton<SignupRepository>(
    () => SignupRepositoryImpl(sl<DioServices>()),
  );
  sl.registerLazySingleton<CategoryRepositiory>(
    () => CategoryRepositioryImp(sl<DioServices>()),
  );
  sl.registerLazySingleton<AnimalRepositiory>( 
    () => AnimalRepositioryImp(sl<DioServices>()),
  );

  sl.registerFactory<SignupViewmodel>(
    () => SignupViewmodel(sl<SignupRepository>()),
  );

  sl.registerFactory<LoginViewModel>(
    () => LoginViewModel(sl<LoginRepository>()),
  );

  sl.registerFactory<ForgetPasswordViewModel>(
    () => ForgetPasswordViewModel(sl<LoginRepository>()),
  );
  sl.registerFactory<OtpViewmodel>(() => OtpViewmodel(sl<SignupRepository>()));
  sl.registerFactory<CreateCategoryCubit>(
    () => CreateCategoryCubit(sl<CategoryRepositiory>()),
  );
  sl.registerFactory<CreateAnimalCubit>(
    () => CreateAnimalCubit(sl<AnimalRepositiory>()),
  );
}
