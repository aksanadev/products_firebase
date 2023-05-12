part of 'category_cubit.dart';

abstract class CategoryState extends Equatable {
  const CategoryState();

  @override
  List<Object?> get props => [];
}

class CategoryInitial extends CategoryState {
  final String categoryPlateholder;

  const CategoryInitial({required this.categoryPlateholder});
  @override
  List<Object> get props => [categoryPlateholder];
}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final List<CategoryModel> categories;
  final CategoryEntity? category;

  const CategoryLoaded({this.categories = const [], this.category});

  @override
  List<Object?> get props => [categories, category];
}

class CategoryError extends CategoryState {
  final String errorMessage;

  const CategoryError({required this.errorMessage});
}
