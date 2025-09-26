part of 'create_animal_cubit.dart';

sealed class CreateAnimalState extends Equatable {
  const CreateAnimalState();

  @override
  List<Object> get props => [];
}

final class CreateAnimalInitial extends CreateAnimalState {}

final class CreateAnimalLoading extends CreateAnimalState {}

final class CreateAnimalSuccess extends CreateAnimalState {
  final AnimalModel animalModel;
  const CreateAnimalSuccess({required this.animalModel});
  @override
  List<Object> get props => [animalModel];
}

final class CreateAnimalError extends CreateAnimalState {
  final String errorMessage;
  const CreateAnimalError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
