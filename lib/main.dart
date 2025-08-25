import 'package:animoo_app/core/api/dio_services.dart';
import 'package:animoo_app/core/routes/app_route.dart';
import 'package:dio/dio.dart';
import 'package:animoo_app/features/auth/signUp/repo/signup_repository_impl.dart';
import 'package:animoo_app/features/auth/signUp/view_models/signup_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final dioServices = DioServices(dio: Dio());
    final signupRepository = SignupRepositoryImpl(dioServices);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignupViewmodel(signupRepository)),
      ],
      child: ScreenUtilInit(
        designSize: const Size(375, 812),
        minTextAdapt: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Animoo App',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: AppRouteManager.onGenerateRoute,
          );
        },
      ),
    );
  }
}
