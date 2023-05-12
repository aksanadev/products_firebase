import 'package:dartz/dartz.dart';
import 'package:products_firebase/data/models/category_model.dart';
import 'package:products_firebase/data/repositories/category/cateagory_repository_impl.dart';
import 'package:products_firebase/domain/failures/failures.dart';
import 'package:products_firebase/domain/repositories/category_repo.dart';

class CategoryUsecases {
  CategoryUsecases({required this.categoryRepo});
  final CategoryRepo categoryRepo;

  Future<Either<Failure, List<CategoryModel>>> getCategories() async {
    // calls repository-impl to get data (failure or data)
    // proceed with business login (manipulate the data)
    // as a reult after doing this, if with format/parse the data to the correct formar from the repo
    // [ USECASES is where the business logic gets exectued ]

    // return right(CategoryEntity(name: 'test NAME', imageUrl: 'test Image'));
    // return left(ServerFailure());
    return categoryRepo.getCategoriesFromDatasource();
  }
}
