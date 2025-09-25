part of 'show_all_animals_cubit.dart';

sealed class ShowAllAnimalsState extends Equatable {
  const ShowAllAnimalsState();

  @override
  List<Object> get props => [];
}

final class ShowAllAnimalsInitial extends ShowAllAnimalsState {}
final class ShowAllAnimalsLoading extends ShowAllAnimalsState {}
final class ShowAllAnimalsSuccess extends ShowAllAnimalsState {
  final List<AnimalModel> animals;
  const ShowAllAnimalsSuccess({required this.animals});
  @override
  List<Object> get props => [animals];
}

final class ShowAllAnimalsError extends ShowAllAnimalsState {
  final String errorMessage;
  const ShowAllAnimalsError({required this.errorMessage});
  @override
  List<Object> get props => [errorMessage];
}
