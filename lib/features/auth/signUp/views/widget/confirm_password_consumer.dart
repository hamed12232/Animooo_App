import 'package:animoo_app/core/widget/custom_button.dart';
import 'package:animoo_app/features/auth/signUp/view_models/otp_state.dart';
import 'package:animoo_app/features/auth/signUp/view_models/otp_viewmodel.dart';
import 'package:animoo_app/features/auth/signUp/views/screen/otpVerificationScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ConfirmOtpConsumer extends StatelessWidget {
  const ConfirmOtpConsumer({super.key, required this.widget});

  final Otpverificationscreen widget;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OtpViewmodel, OtpState>(
      listener: (BuildContext context, state) {
        if (state is OtpError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
        } else if (state is OtpSuccess) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.loginModel.message!)));
        }
      },
      builder: (BuildContext context, state) {
        String code = state.code;
        if (state is OtpLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return CustomButton(
          text: "Confirm",
          onPressed: () async {
            if (code.isEmpty) return;
            await context.read<OtpViewmodel>().verifyOtp(widget.email, code);
          },
        );
      },
    );
  }
}
