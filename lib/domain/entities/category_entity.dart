import 'package:equatable/equatable.dart';
import 'package:products_firebase/data/models/category_model.dart';

class CategoryEntity extends Equatable {
  String name;
  String imageUrl;
  List<CategoryModel> categories; //non-primitive type; primitive: String, dynamic, double, etc.

  CategoryEntity({required this.name, required this.imageUrl, this.categories = const []});

  @override
  List<Object?> get props => [name, imageUrl];
}
