import 'package:animoo_app/core/api/dio_services.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/features/auth/login/widgets/custom_app_bar_verification.dart';
import 'package:animoo_app/features/auth/login/widgets/custom_title_subTitle_verification.dart';
import 'package:animoo_app/features/auth/signUp/repo/signup_repository_impl.dart';
import 'package:animoo_app/features/auth/signUp/view_models/otp_state.dart';
import 'package:animoo_app/features/auth/signUp/view_models/otp_viewmodel.dart';
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
          child: BlocConsumer<OtpViewmodel, OtpState>(
            listener: (BuildContext context, state) {
              if (state is OtpError) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              } else if (state is OtpSuccess) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.loginModel.message!)),
                );
              }
            },
            builder: (BuildContext context, state) {
              String code = state is OtpInitial ? state.code : "";
              if (state is OtpLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
                children: [
                  CustomAppBarVerification(text: "Cancel"),
                  VerticalSpace(height: AppHeight.h16),
                  CustomTitleAndSubTitleVerficiation(
                    title: "OTP Verification",
                    subtitle:
                        "Please enter the 5 digit code sent your phone number",
                  ),
                  VerticalSpace(height: AppHeight.h54),
                  CustomPinCodeTextField(
                    onCompleted: (value) =>
                        context.read<OtpViewmodel>().updateCode(value),
                    onSubmitted: (value) =>
                        context.read<OtpViewmodel>().updateCode(value),
                  ),
                  VerticalSpace(height: AppHeight.h41),
                  CustomButton(
                    text: "Confirm",
                    onPressed: () async {
                      if (code.isEmpty) return;
                      await context.read<OtpViewmodel>().verifyOtp(
                        widget.email,
                        code,
                      );
                    },
                  ),
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
              );
            },
          ),
        ),
      ),
    );
  }
}
