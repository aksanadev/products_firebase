import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:products_firebase/data/models/category_model.dart';
import 'package:products_firebase/data/repositories/category/base_category_repo.dart';

class CategoryRepository extends BaseCategoryRepo {
  final FirebaseFirestore _firebaseFirestore;

  CategoryRepository({FirebaseFirestore? firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Future<List<CategoryModel>> getAllCategories() async {
    return (await _firebaseFirestore.collection('categories').get())
        .docs
        .map((e) => CategoryModel.fromJson(e.data()))
        .toList();
  }
}
