
import 'dart:ui';

import 'package:animoo_app/core/constant/const_manager.dart';
import 'package:animoo_app/core/models/password_rules.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/features/auth/signUp/views/widget/custom_password_rules.dart';
import 'package:flutter/material.dart';

class CustomListViewPasswordRequiredRules extends StatelessWidget {
  final Stream<List<PasswordRulesModel>> stream;
  
  const CustomListViewPasswordRequiredRules({
    super.key,
    required this.stream,
  });

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PasswordRulesModel>>(
      stream: stream,
      initialData: ConstsListsManager.passwordRulesRequirements,
      builder: (context, snapshot) {
        return ListView.separated(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            bool valid = snapshot.data![index].valid;
            return CustomPasswordRules(
              rulesColor: valid
                  ? AppColors.krulesOfPasswordColor
                  : AppColors.kannotationPasswordColor,
              rulesText: snapshot.data![index].title,
              decoration: valid ? TextDecoration.lineThrough : TextDecoration.none
            );
          },
          separatorBuilder: (context, index) => VerticalSpace(height: AppHeight.h5),
          itemCount: snapshot.data!.length,
        );
      },
    );
  }
}
