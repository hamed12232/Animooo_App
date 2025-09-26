import 'package:animoo_app/core/DI/get_it.dart';
import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/features/animal/view_model/cubit/show_all_animals_cubit.dart';
import 'package:animoo_app/features/category/view_model/show_all_categories/show_all_categories_cubit.dart';
import 'package:animoo_app/features/home/view/widget/custom_animals_section_items.dart';
import 'package:animoo_app/features/home/view/widget/custom_app_bar_home_screen.dart';
import 'package:animoo_app/features/home/view/widget/custom_category_section_items.dart';
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
  late final ShowAllAnimalsCubit _animalsCubit;
  @override
  void initState() {
    super.initState();
    _categoriesCubit = sl<ShowAllCategoriesCubit>()..showAllCategories();
    _animalsCubit = sl<ShowAllAnimalsCubit>()..showAllAnimals();
  }

  @override
  void dispose() {
    _categoriesCubit.close();
    super.dispose();
  }

  Future<void> _onRefresh() async {
    await Future.wait([
      _categoriesCubit.showAllCategories(),
      _animalsCubit.showAllAnimals(),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: _categoriesCubit),
        BlocProvider.value(value: _animalsCubit),
      ],
      child: RefreshIndicator(
        color: AppColors.kprimaryColor,
        onRefresh: _onRefresh,
        child: Scaffold(
          backgroundColor: AppColors.kbackGroungColor,
          body: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const CustomAppBarHomeScreen(),
                    VerticalSpace(height: AppHeight.h20),
                    const CustomCategorySectionItems(),
                    VerticalSpace(height: AppHeight.h20),
                    const CustomAnimalsSectionItems(),
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
