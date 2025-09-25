import 'package:animoo_app/features/animal/model/animal_model.dart';
import 'package:animoo_app/features/animal/repo/animal_repositiory.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_all_animals_state.dart';

class ShowAllAnimalsCubit extends Cubit<ShowAllAnimalsState> {
  ShowAllAnimalsCubit(this.animalRepositiory) : super(ShowAllAnimalsInitial());
  final AnimalRepositiory animalRepositiory;

  Future<void> showAllAnimals() async {
    emit(ShowAllAnimalsLoading());
    final result = await animalRepositiory.showAllAnimals();
    result.fold(
      (errorModel) =>
          emit(ShowAllAnimalsError(errorMessage: errorModel.error.toString())),
      (animalModel) => emit(ShowAllAnimalsSuccess(animals: animalModel)),
    );
  }
}
