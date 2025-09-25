import 'package:animoo_app/core/spacing/vertical_space.dart';
import 'package:animoo_app/core/style/app_colors.dart';
import 'package:animoo_app/core/style/app_height.dart';
import 'package:animoo_app/features/animal/view_model/cubit/show_all_animals_cubit.dart';
import 'package:animoo_app/features/home/view/widget/category_section_header.dart';
import 'package:animoo_app/features/home/view/widget/petCard_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomAnimalsSectionItems extends StatelessWidget {
  const CustomAnimalsSectionItems({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShowAllAnimalsCubit, ShowAllAnimalsState>(
      listener: (context, state) {
        if (state is ShowAllAnimalsError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error: ${state.errorMessage}')),
          );
        }
      },
      builder: (context, state) {
        if (state is ShowAllAnimalsLoading) {
          return const Center(child: CircularProgressIndicator(
          color: AppColors.kprimaryColor,
          ));
        } else if (state is ShowAllAnimalsSuccess) {
          final animals = state.animals;
          return Column(
            children: [
              CategorySectionHeader(
                headerName: "All Animal ( ${animals.length} )",
                productType: "Animal",
              ),
              VerticalSpace(height: AppHeight.h11),
               PetCardListView(animals: animals,),
            ],
          );
        }
        return const SizedBox.shrink();
        
      },
    );
  }
}
