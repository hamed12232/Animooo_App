import 'package:animoo_app/core/DI/get_it.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/features/category/view_model/show_all_categories/show_all_categories_cubit.dart';
import 'package:animoo_app/features/home/view/widget/category_section_header.dart';
import 'package:animoo_app/features/home/view/widget/custom_app_bar_home_screen.dart';
import 'package:animoo_app/features/home/view/widget/custom_category_section_items.dart';
import 'package:animoo_app/features/home/view/widget/petCard_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ShowAllCategoriesCubit _categoriesCubit;
  @override
  void initState() {
    super.initState();
    _categoriesCubit = sl<ShowAllCategoriesCubit>()..showAllCategories();
  }

  @override
  void dispose() {
    _categoriesCubit.close();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await _categoriesCubit.showAllCategories(); // Use local instance
  }
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _categoriesCubit,
      child: RefreshIndicator(
        onRefresh: _onRefresh,
        child: Scaffold(
          backgroundColor: AppColors.kbackGroungColor,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                  const  CustomAppBarHomeScreen(),
                    VerticalSpace(height: AppHeight.h20),
                  const  CustomCategorySectionItems(),
                    VerticalSpace(height: AppHeight.h20),
                  const  CategorySectionHeader(
                      headerName: "All Animal ( 10 )",
                      productType: "Animal",
                    ),
                    VerticalSpace(height: AppHeight.h11),
                  const  PetCardListView(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
