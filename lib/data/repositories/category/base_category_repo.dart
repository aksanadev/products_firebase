import 'package:products_firebase/data/models/category_model.dart';

abstract class BaseCategoryRepo {
  Future<List<CategoryModel>> getAllCategories();
}
