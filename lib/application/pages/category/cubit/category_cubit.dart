import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:products_firebase/data/models/category_model.dart';
import 'package:products_firebase/data/repositories/category/cateagory_repository_impl.dart';
import 'package:products_firebase/domain/entities/category_entity.dart';
import 'package:products_firebase/domain/failures/failures.dart';
import 'package:products_firebase/domain/usecases/category_usecases.dart';

part 'category_state.dart';

const String serverFailure = 'Server Failure Occured';
const String cacheFailure = 'Cache Failure Occured';
const String generalFailure = 'General Failure Occured';
const String unknownlFailure = 'Unknown Failure Occured';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit()
      : super(const CategoryInitial(categoryPlateholder: 'Zero Categories'));
  final CategoryUsecases categoryUsecases = CategoryUsecases();
  // could use other usecases (collection of methods that has to do with the category)
  // usecase is where the business logic gets exectued

  Future<void> adviceRequested() async {
    emit(CategoryLoading());
    final failureOrCategories = await categoryUsecases.getCategories();

    failureOrCategories.fold(
      (failure) =>
          emit(CategoryError(errorMessage: _mapFailureToMessage(failure))),
      (categories) => emit(CategoryLoaded(categories: categories)),
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return serverFailure;
      case CacheFailure:
        return cacheFailure;
      case GeneralFailure:
        return generalFailure;
      default:
        return unknownlFailure;
    }
  }
}
