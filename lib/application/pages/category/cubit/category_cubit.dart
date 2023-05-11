import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:products_firebase/data/models/category_model.dart';
import 'package:products_firebase/data/repositories/category/cateagory_repository.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
    final CategoryRepository _categoryRepository;
  CategoryCubit(this._categoryRepository) : super(const CategoryInitial(categoryPlateholder: 'Zero Categories'));

  Future<void> adviceRequest() async {
    emit(CategoryLoading());
      final categories = await _categoryRepository.getAllCategories();
      // Future.delayed(Duration(seconds: 5));
      emit(CategoryLoaded(categories: categories));
      // emit(const CategoryError(error: 'Category Error'));
  }
}
