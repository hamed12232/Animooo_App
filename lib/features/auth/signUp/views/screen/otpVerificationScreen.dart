import 'package:animoo_app/core/DI/get_it.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/features/auth/login/view/screen/createNewPassword.dart';
import 'package:animoo_app/features/auth/login/view/widgets/custom_app_bar_verification.dart';
import 'package:animoo_app/features/auth/login/view/widgets/custom_title_subTitle_verification.dart';
import 'package:animoo_app/features/auth/signUp/view_models/otp_state.dart';
import 'package:animoo_app/features/auth/signUp/view_models/otp_viewmodel.dart';
import 'package:animoo_app/features/auth/signUp/views/widget/custom_pin_code_text_field.dart';
import 'package:animoo_app/features/auth/signUp/views/widget/resend_code_timer_animated.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Otpverificationscreen extends StatefulWidget {
  const Otpverificationscreen({
    super.key,
    required this.email,
    this.isFromForgotPassword = false,
  });
  final String email;
  final bool isFromForgotPassword;

  static const String routeName = "/otp";

  @override
  State<Otpverificationscreen> createState() => _OtpverificationscreenState();
}

class _OtpverificationscreenState extends State<Otpverificationscreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<OtpViewmodel>(),
      child: Scaffold(
        backgroundColor: AppColors.kbackGroungColor,
        resizeToAvoidBottomInset: true,
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
                if (widget.isFromForgotPassword) {
                  Navigator.pushNamed(
                    context,
                    CreateNewPassword.routeName,
                    arguments: widget.email,
                  );
                }
              } else if (state is OtpResend) {
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text(state.message)));
              }
            },
            builder: (BuildContext context, state) {
              String code = state.code;
              if (state is OtpLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return Column(
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
                  ResendCodeTimerAnimated(
                    startFrom: const Duration(seconds: 60),
                    onResend: () async {
                      await context.read<OtpViewmodel>().resendOtp(
                        widget.email,
                      );
                    },
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
