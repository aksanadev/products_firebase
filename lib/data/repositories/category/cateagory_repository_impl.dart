import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:products_firebase/data/datasources/category_remote_datasource.dart';
import 'package:products_firebase/data/models/category_model.dart';
import 'package:products_firebase/domain/entities/category_entity.dart';
import 'package:products_firebase/domain/failures/failures.dart';
import 'package:products_firebase/domain/repositories/category_repo.dart';

class CategoryRepositoryImpl extends CategoryRepo {
  final CategoryRemoteDatasources categoryRemoteDatasources =
      CategoryRemoteDatasourcesImpl();

  @override
  Future<Either<Failure, List<CategoryModel>>>
      getCategoriesFromDatasource() async {
    final result = await categoryRemoteDatasources.getCategoriesFromFirebase();
    return right(result);
  }
}
