import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_firebase/application/pages/category/cubit/category_cubit.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        BlocProvider.of<CategoryCubit>(context).adviceRequested();
      },
      child: Material(
        elevation: 3,
        child: Container(
            color: Colors.green, child: const Text('get all categories')),
      ),
    );
  }
}
