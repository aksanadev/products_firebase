part of 'category_bloc.dart';

abstract class CategoryDEPRECATEDState extends Equatable {
  const CategoryDEPRECATEDState();

  @override
  List<Object> get props => [];
}

class CategoryInitial extends CategoryDEPRECATEDState {
  final String categoryPlateholder;

  const CategoryInitial({required this.categoryPlateholder});
  @override
  List<Object> get props => [categoryPlateholder];
}

class CategoryLoading extends CategoryDEPRECATEDState {}

class CategoryLoaded extends CategoryDEPRECATEDState {
  final List<CategoryModel> categories;

  const CategoryLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

class CategoryError extends CategoryDEPRECATEDState {
  final String errorMessage;

  const CategoryError({required this.errorMessage});
}
