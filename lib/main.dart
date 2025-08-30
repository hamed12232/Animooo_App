import 'package:animoo_app/core/DI/get_it.dart';
import 'package:animoo_app/core/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  setup();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'Animoo App',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: AppRouteManager.onGenerateRoute,
        );
      },
    );
  }
}
