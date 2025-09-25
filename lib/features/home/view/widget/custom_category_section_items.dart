import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/features/category/view_model/show_all_categories/show_all_categories_cubit.dart';
import 'package:animoo_app/features/home/view/widget/category_section_header.dart';
import 'package:animoo_app/features/home/view/widget/custom_list_view_seperator_categories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomCategorySectionItems extends StatelessWidget {
  const CustomCategorySectionItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowAllCategoriesCubit, ShowAllCategoriesState>(
      listener: (context, state) {
        if (state is ShowAllCategoriesError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.errorMessage}')),
          );
        }
      },
      builder: (context, state) {
        if (state is ShowAllCategoriesLoading) {
          return const Center(child: CircularProgressIndicator(
          color: AppColors.kprimaryColor,
          ));
        } else if (state is ShowAllCategoriesSuccess) {
          final categories = state.categories;
          return Column(
            children: [
              CategorySectionHeader(
                headerName: "Categories ( ${categories.length} )",
                productType: "Category",
              ),
              VerticalSpace(height: AppHeight.h20),
              CustomListViewSeperatorCategories(categories: categories),
            ],
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
