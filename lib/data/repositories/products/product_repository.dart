import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:products_firebase/data/models/product_model.dart';
import 'package:products_firebase/data/repositories/products/base_product_repo.dart';

class ProductRepository extends BaseProductRepo {
  final FirebaseFirestore _firebaseFirestore;

  ProductRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<List<ProductModel>> getAllProducts() async {
    return (await _firebaseFirestore.collection('products').get())
        .docs
        .map((e) => ProductModel.fromJson(e.data()))
        .toList();
  }
}
