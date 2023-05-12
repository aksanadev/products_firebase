

import 'package:equatable/equatable.dart';
import 'package:products_firebase/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity with EquatableMixin{
  CategoryModel({
    required String name,
    required String imageUrl,
  }) : super(name: name, imageUrl: imageUrl);

  @override
  List<Object?> get props => [name, imageUrl];

  factory CategoryModel.fromJson(Map<String,dynamic> json) => CategoryModel(name: json['name'], imageUrl: json['imageUrl']);
}
