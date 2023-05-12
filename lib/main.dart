import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_firebase/application/pages/category/category_page.dart';
import 'package:products_firebase/application/pages/category/cubit/category_cubit.dart';
import 'package:products_firebase/data/repositories/category/cateagory_repository_impl.dart';
import 'package:products_firebase/injection.dart';
import 'injection.dart' as di;

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Categories to Products',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CategoryPageWrapperProvider(),
    );
  }
}
