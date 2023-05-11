import 'package:equatable/equatable.dart';

class ProductModel extends Equatable {
  String name;
  String category;
  String imageUrl;
  double price;
  bool isRecommended;
  bool isPopular;

  ProductModel({
    required this.name,
    required this.category,
    required this.imageUrl,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
  });

  @override
  List<Object?> get props => [name, imageUrl];

  factory ProductModel.fromJson(Map<String,dynamic> snap) => ProductModel(
        name: snap['name'],
        category: snap['category'],
        imageUrl: snap['imageUrl'],
        price: snap['price'],
        isRecommended: snap['isRecommended'],
        isPopular: snap['isPopular'],
      );
}
