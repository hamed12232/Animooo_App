import 'package:animoo_app/core/constant/asset_values.dart';
import 'package:animoo_app/core/constant/const_manager.dart';
import 'package:animoo_app/core/models/password_rules.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_fonts_size.dart';
import 'package:flutter/material.dart';

class PasswordRulesStreamBuilder extends StatelessWidget {
  const PasswordRulesStreamBuilder({
    super.key,
    required this.listPasswordRulesOutPutStream,
  });

  final Stream<List<PasswordRulesModel>> listPasswordRulesOutPutStream;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PasswordRulesModel>>(
      stream: listPasswordRulesOutPutStream,
      initialData:
          ConstsListsManager.passwordRulesRequirements,
      builder: (context, snapshot) {
        final rules =
            snapshot.data ?? const <PasswordRulesModel>[];
        if (rules.any((x) => !x.valid)) {// if any rule is not valid
          return Text(
            "Please add all necessary characters to create safe password.",
            style: TextStyle(
              fontFamily: FontValues.poppins,
              color: AppColors.kannotationPasswordColor,
              fontSize: AppFontsSize.s10,
              fontWeight: FontWeight.w600,
            ),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
