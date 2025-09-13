part of 'create_category_cubit.dart';

sealed // to make sure that only this file can extend this class
 class CreateCategoryState extends Equatable {
  const CreateCategoryState();

  @override
  List<Object> get props => [];
}

final class CreateCategoryInitial extends CreateCategoryState {}

final class CreateCategoryLoading extends CreateCategoryState {}
final class CreateCategorySuccess extends CreateCategoryState {
  final CategoryModel categoryModel;
  const CreateCategorySuccess(this.categoryModel);

  @override
  List<Object> get props => [categoryModel];
  // to make Equatable work properly and compare objects of the same type and not just their memory address
}

final class CreateCategoryError extends CreateCategoryState {
  final String errorMessage;
  const CreateCategoryError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
