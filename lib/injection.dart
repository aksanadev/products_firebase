import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get_it/get_it.dart';
import 'package:products_firebase/application/pages/category/cubit/category_cubit.dart';
import 'package:products_firebase/data/datasources/category_remote_datasource.dart';
import 'package:products_firebase/data/repositories/category/cateagory_repository_impl.dart';
import 'package:products_firebase/domain/repositories/category_repo.dart';
import 'package:products_firebase/domain/usecases/category_usecases.dart';
import 'package:firebase_core/firebase_core.dart';

final sl = GetIt.I;

Future<void> init() async {
  // application layer
  // Factory = everytime is a new Instance() of that class
  // sl() will find the value

  //[   Application layer   ]
  sl.registerFactory(() => CategoryCubit(categoryUsecases: sl()));

  /// [      keeps the old instance of the bloc to save the state        ] [   Singleton   ]
  // sl.registerLazySingleton(() => CategoryCubit(categoryUsecases: sl()));

  //[   Domain layer   ]
  sl.registerFactory(() => CategoryUsecases(categoryRepo: sl()));

  //[   Data layer   ]
  sl.registerFactory<CategoryRepo>(
      () => CategoryRepositoryImpl(categoryRemoteDatasources: sl()));

  sl.registerFactory<CategoryRemoteDatasources>(
      () => CategoryRemoteDatasourcesImpl(firebaseFirestore: sl()));

  // //[   Externs   ]
  sl.registerFactory(() => FirebaseFirestore.instance);
}
