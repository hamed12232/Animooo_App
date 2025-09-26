import 'package:animoo_app/core/style/padding.dart';
import 'package:animoo_app/features/animal/model/animal_model.dart';
import 'package:animoo_app/features/home/view/widget/pet_card.dart';
import 'package:flutter/material.dart';

class PetCardListView extends StatelessWidget {
  const PetCardListView({super.key, required this.animals});
  final List<AnimalModel> animals;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        return  PetCard(animalModel: animals[index],);
      },
      itemCount: animals.length,
      padding: const EdgeInsets.symmetric(horizontal: PAdding.kPadding16),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}
