import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:products_firebase/data/exceptions/exceptions.dart';
import 'package:products_firebase/data/models/category_model.dart';

abstract class CategoryRemoteDatasources {
  Future<List<CategoryModel>> getCategoriesFromFirebase();
}

class CategoryRemoteDatasourcesImpl extends CategoryRemoteDatasources {
  final FirebaseFirestore firebaseFirestore;

  CategoryRemoteDatasourcesImpl({required this.firebaseFirestore});

  @override
  Future<List<CategoryModel>> getCategoriesFromFirebase() async {
    try {
      final response = (await firebaseFirestore.collection('categories').get());

      return response.docs
          .map((e) => CategoryModel.fromJson(e.data()))
          .toList();
    } on FirebaseException catch (_) {
      throw ServerException();
    }
  }
}
