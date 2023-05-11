import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_firebase/application/pages/category/bloc/category_bloc.dart';
import 'package:products_firebase/application/pages/product/widgets/category_field.dart';
import 'package:products_firebase/application/pages/product/widgets/custom_button.dart';
import 'package:products_firebase/application/pages/product/widgets/error_message.dart';
import 'package:products_firebase/data/repositories/category/cateagory_repository.dart';

class ProductPageWrapperProvider extends StatelessWidget {
  const ProductPageWrapperProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          CategoryBloc(categoryRepository: CategoryRepository()),
      child: const ProductPage(),
    );
  }
}

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 30, bottom: 2, left: 5, right: 5),
        child: Center(
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics(),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  // height: height * 1,
                  // width: width * .85,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 5),
                    child: Column(
                      children: [
                        BlocBuilder<CategoryBloc, CategoryState>(
                          builder: (context, state) {
                            if (state is CategoryInitial) {
                              return const Text('Zero Categories');
                            } else if (state is CategoryLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (state is CategoryLoaded) {
                              return Column(
                                children: [
                                  // CategoryField(category: state.categories)
                                  ...state.categories
                                      .map((category) => Column(
                                            children: [
                                              Text(category.name),
                                              SizedBox(
                                                height: height * .3,
                                                child: Image.network(
                                                  category.imageUrl,
                                                  fit: BoxFit.cover,
                                                  height: double.infinity,
                                                  width: double.infinity,
                                                ),
                                              ),
                                            ],
                                          ))
                                      .toList(),
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    physics: const BouncingScrollPhysics(
                                        parent:
                                            AlwaysScrollableScrollPhysics()),
                                    child: Row(
                                      children: [
                                        ...state.categories
                                            .map(
                                              (softDrink) => SizedBox(
                                                height: height * .27,
                                                width: width * .4,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.all(20),
                                                  child: Card(
                                                    elevation: 3,
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: height * .17,
                                                          child: Image.network(
                                                            softDrink.imageUrl,
                                                            fit: BoxFit.contain,
                                                            height:
                                                                double.infinity,
                                                            width:
                                                                double.infinity,
                                                          ),
                                                        ),
                                                        Text(softDrink.name),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                            .toList(),
                                      ],
                                    ),
                                  ),
                                ],
                              );
                            } else if (state is CategoryError) {
                              return ErrorMessage(
                                  errorMessage: state.errorMessage);
                            } else {
                              return const SizedBox();
                            }
                          },
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const CustomButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
