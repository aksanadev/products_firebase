import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:products_firebase/data/models/category_model.dart';
import 'package:products_firebase/data/repositories/category/cateagory_repository.dart';

part 'category_event.dart';
part 'category_state.dart';

class CategoryBloc extends Bloc<CategoryEvent, CategoryState> {
  final CategoryRepository _categoryRepository;

  CategoryBloc({required CategoryRepository categoryRepository})
      : _categoryRepository = categoryRepository,
        super(const CategoryInitial(categoryPlateholder: 'Zero Categories')) {
    on<LoadedCategories>((event, emit) async {
      emit(CategoryLoading());
      final categories = await _categoryRepository.getAllCategories();
      emit(CategoryLoaded(categories: categories));
    });
  }
}
