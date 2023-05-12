import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:products_firebase/data/models/category_model.dart';
import 'package:products_firebase/domain/failures/failures.dart';

abstract class CategoryRemoteDatasources {
  Future<List<CategoryModel>> getCategoriesFromFirebase();
}

class CategoryRemoteDatasourcesImpl extends CategoryRemoteDatasources {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  @override
  Future<List<CategoryModel>> getCategoriesFromFirebase() async {
    return (await _firebaseFirestore.collection('categories').get())
        .docs
        .map((e) => CategoryModel.fromJson(e.data()))
        .toList();
  }
}
