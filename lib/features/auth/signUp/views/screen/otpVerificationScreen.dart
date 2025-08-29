import 'package:animoo_app/core/api/dio_services.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/features/auth/login/view/widgets/custom_app_bar_verification.dart';
import 'package:animoo_app/features/auth/login/view/widgets/custom_title_subTitle_verification.dart';
import 'package:animoo_app/features/auth/signUp/repo/signup_repository_impl.dart';
import 'package:animoo_app/features/auth/signUp/view_models/otp_viewmodel.dart';
import 'package:animoo_app/features/auth/signUp/views/widget/confirm_password_consumer.dart';
import 'package:animoo_app/features/auth/signUp/views/widget/custom_pin_code_text_field.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Otpverificationscreen extends StatefulWidget {
  const Otpverificationscreen({super.key, required this.email});
  final String email;

  static const String routeName = "/otp";

  @override
  State<Otpverificationscreen> createState() => _OtpverificationscreenState();
}

class _OtpverificationscreenState extends State<Otpverificationscreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          OtpViewmodel(SignupRepositoryImpl(DioServices(dio: Dio()))),
      child: Scaffold(
        backgroundColor: AppColors.kbackGroungColor,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Column(
            children: [
              CustomAppBarVerification(text: "Cancel"),
              VerticalSpace(height: AppHeight.h16),
              CustomTitleAndSubTitleVerficiation(
                title: "OTP Verification",
                subtitle: "Please enter the 5 digit code sent your email",
              ),
              VerticalSpace(height: AppHeight.h54),
              CustomPinCodeTextField(
                onCompleted: (value) =>
                    context.read<OtpViewmodel>().updateCode(value),
                onSubmitted: (value) =>
                    context.read<OtpViewmodel>().updateCode(value),
              ),
              VerticalSpace(height: AppHeight.h41),
              ConfirmOtpConsumer(widget: widget),

              VerticalSpace(height: AppHeight.h8),
              Text(
                "Resend Code In 00:59",
                style: TextStyle(
                  color: AppColors.kgreyColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
