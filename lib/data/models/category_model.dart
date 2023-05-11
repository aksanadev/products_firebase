

import 'package:equatable/equatable.dart';

class CategoryModel extends Equatable {
  String name;
  String imageUrl;

  CategoryModel({
    required this.name,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  factory CategoryModel.fromJson(Map<String,dynamic> json) => CategoryModel(name: json['name'], imageUrl: json['imageUrl']);
}
