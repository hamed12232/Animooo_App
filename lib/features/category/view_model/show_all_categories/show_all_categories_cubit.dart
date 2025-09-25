import 'package:animoo_app/features/category/model/category_model.dart';
import 'package:animoo_app/features/category/repo/category_repositiory.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'show_all_categories_state.dart';

class ShowAllCategoriesCubit extends Cubit<ShowAllCategoriesState> {
  ShowAllCategoriesCubit(this.categoryRepositiory) : super(ShowAllCategoriesInitial());
    final CategoryRepositiory categoryRepositiory;


  Future<void> showAllCategories() async {

    emit(ShowAllCategoriesLoading());
    final result = await categoryRepositiory.showAllCategories();
    result.fold(
      (errorModel) => emit(ShowAllCategoriesError(errorModel.error.toString())),
      (categories) => emit(ShowAllCategoriesSuccess(categories)),
    );
  }
}
