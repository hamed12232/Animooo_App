part of 'show_all_categories_cubit.dart';

sealed class ShowAllCategoriesState extends Equatable {
  const ShowAllCategoriesState();

  @override
  List<Object> get props => [];
}

final class ShowAllCategoriesInitial extends ShowAllCategoriesState {}

final class ShowAllCategoriesLoading extends ShowAllCategoriesState {}
final class ShowAllCategoriesSuccess extends ShowAllCategoriesState {
  final List<CategoryModel> categories;
  const ShowAllCategoriesSuccess(this.categories);

  @override
  List<Object> get props => [categories];
}
final class ShowAllCategoriesError extends ShowAllCategoriesState {
  final String errorMessage;
  const ShowAllCategoriesError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
