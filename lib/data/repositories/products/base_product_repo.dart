import 'package:products_firebase/data/models/product_model.dart';

abstract class BaseProductRepo {
  Future<List<ProductModel>> getAllProducts();
}
