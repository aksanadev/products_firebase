import 'package:flutter/material.dart';
import 'package:products_firebase/data/models/category_model.dart';

class CategoryField extends StatelessWidget {
  final List<CategoryModel> category;
  const CategoryField({super.key, required this.category});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(15),
      child: SizedBox(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(10),
          child: Text("'$category'", textAlign: TextAlign.center,),
        ),
      ),
    );
  }
}
