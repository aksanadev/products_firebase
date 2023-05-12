import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:products_firebase/data/models/category_model.dart';
import 'package:products_firebase/data/repositories/category/cateagory_repository_impl.dart';

part 'category_event.dart';
part 'category_state.dart';

// class CategoryBloc extends Bloc<CategoryEvent, CategoryDEPRECATEDState> {

//   CategoryBloc({required CategoryRepository categoryRepository})
//       : _categoryRepository = categoryRepository,
//         super(const CategoryInitial(categoryPlateholder: 'Zero Categories')) {
//     on<CategoriesRequestEvent>((event, emit) async {
//       emit(CategoryLoading());
//       final categories = await _categoryRepository.getAllCategories();
//       // Future.delayed(Duration(seconds: 5));
//       emit(CategoryLoaded(categories: categories));
//       // emit(const CategoryError(error: 'Category Error'));
//     });
//   }
// }
