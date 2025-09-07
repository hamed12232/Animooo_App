import 'package:animoo_app/core/spacing/horizental_space.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/core/style/app_width.dart';
import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/core/widget/custom_product_type_status.dart';
import 'package:animoo_app/core/widget/custom_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});
  static const String routeName = '/search';

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchKey = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kbackGroungColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: PAdding.kPadding18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              VerticalSpace(height: AppHeight.h16),
              MyTextFormField(
                hintText: "",
                controller: searchKey,
                isObsecure: false,
                suffixIcon: Icon(CupertinoIcons.search),
              ),
              VerticalSpace(height: AppHeight.h8),
              Row(
                children: [
                  CustomProductTypeStatus(  statusText: " Category",
                  statusColor: AppColors.kprimaryColor,
                  color: AppColors.kbackGroungColor,
                  ),
                  HorizentalSpace(width: AppWidth.w12),
                  CustomProductTypeStatus(
                    statusText: " Animal",
                    statusColor: AppColors.kprofileStateColor.withOpacity(0.1),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
