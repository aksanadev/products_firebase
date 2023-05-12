import 'package:dartz/dartz.dart';
import 'package:products_firebase/data/models/category_model.dart';
import 'package:products_firebase/domain/entities/category_entity.dart';
import 'package:products_firebase/domain/failures/failures.dart';

abstract class CategoryRepo {
  Future<Either<Failure, List<CategoryModel>>> getCategoriesFromDatasource();
}
