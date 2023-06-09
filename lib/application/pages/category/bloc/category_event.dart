part of 'category_bloc.dart';

abstract class CategoryEvent extends Equatable {
  const CategoryEvent();
  @override
  List<Object> get props => [];
}

class CategoriesRequestEvent extends CategoryEvent {}

class UpdateCategories extends CategoryEvent {
  final List<CategoryModel> categories;

  const UpdateCategories({required this.categories});

  @override
  List<Object> get props => [categories];
}
