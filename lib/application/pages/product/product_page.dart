import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_firebase/application/pages/category/bloc/category_bloc.dart';
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
    // List products = [
    //   {
    //     "categories": {
    //       {
    //         "Soft Drinks":
    //             "https://drip-drop.imgix.net/listings/Soda-Blog.jpeg?w=1200&fit=max&auto=format&auto=compress"
    //       },
    //       {
    //         "Water":
    //             "https://bitesizebio.com/wp-content/uploads/2017/02/Water-web.jpg"
    //       },
    //       {
    //         "Smoothies":
    //             "https://img.taste.com.au/mVWcTMCW/w1200-h630-cfill/taste/2020/01/jan20_easy-berry-smoothie-taste-156331-1.jpg"
    //       },
    //     },
    //     "softDrinks": [
    //       {
    //         "Sprite":
    //             "https://cdn.freebiesupply.com/logos/large/2x/sprite-3-logo-png-transparent.png"
    //       },
    //       {
    //         "Coca Cola Coke":
    //             "https://download.logo.wine/logo/Coca-Cola/Coca-Cola-Logo.wine.png"
    //       },
    //       {
    //         "Rootbeer":
    //             "https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Barq%27s_wordmark.svg/800px-Barq%27s_wordmark.svg.png"
    //       },
    //     ],
    //     "water": [
    //       {"Aquafina": "https://cdn.worldvectorlogo.com/logos/aquafina-1.svg"},
    //       {
    //         "Ozarka":
    //             "https://upload.wikimedia.org/wikipedia/commons/a/a3/Ozarka_Badge_Logo.svg"
    //       },
    //       {
    //         "Figi":
    //             "https://ih1.redbubble.net/image.986837459.8568/st,small,845x845-pad,1000x1000,f8f8f8.jpg"
    //       },
    //     ],
    //     "smoothies": [
    //       {
    //         "Smoothie King":
    //             "https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Smoothie_King_logo.svg/1200px-Smoothie_King_logo.svg.png"
    //       },
    //       {
    //         "Jamba Juice":
    //             "https://brandslogo.net/wp-content/uploads/2013/03/jamba-juice-vector-logo.png"
    //       },
    //       {
    //         "Jamba Juice":
    //             "https://brandslogo.net/wp-content/uploads/2013/03/jamba-juice-vector-logo.png"
    //       },
    //     ],
    //   },
    // ];
    // Map categories = {
    //   'Soft Drinks':
    //       'https://drip-drop.imgix.net/listings/Soda-Blog.jpeg?w=1200&fit=max&auto=format&auto=compress',
    //   'Water':
    //       'https://bitesizebio.com/wp-content/uploads/2017/02/Water-web.jpg',
    //   'Smoothies':
    //       'https://img.taste.com.au/mVWcTMCW/w1200-h630-cfill/taste/2020/01/jan20_easy-berry-smoothie-taste-156331-1.jpg',
    // };

    // Map softDrinks = {
    //   'Sprite':
    //       'https://cdn.freebiesupply.com/logos/large/2x/sprite-3-logo-png-transparent.png',
    //   'Coca Cola Coke':
    //       'https://download.logo.wine/logo/Coca-Cola/Coca-Cola-Logo.wine.png',
    //   'Rootbeer':
    //       'https://upload.wikimedia.org/wikipedia/commons/thumb/0/0a/Barq%27s_wordmark.svg/800px-Barq%27s_wordmark.svg.png',
    // };

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return BlocBuilder<CategoryBloc, CategoryState>(
      builder: (context, state) {
        if (state is CategoryInitial) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Initial State'),
              centerTitle: true,
            ),
          );
        } else if (state is CategoryLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is CategoryLoaded) {
          return Scaffold(
            body: Padding(
              padding:
                  const EdgeInsets.only(top: 30, bottom: 2, left: 5, right: 5),
              child: Center(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(
                    parent: AlwaysScrollableScrollPhysics(),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * .57,
                        // width: width * .85,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 10, bottom: 5),
                          child: Column(
                            children: [
                              ...state.categories.map((e) => Column(
                                    children: [
                                      SizedBox(
                                        height: height * .25,
                                        child: Image.network(
                                          e.imageUrl,
                                          fit: BoxFit.cover,
                                          height: double.infinity,
                                          width: double.infinity,
                                        ),
                                      ),
                                      Text(e.name),
                                    ],
                                  )),

                              // SingleChildScrollView(
                              //   scrollDirection: Axis.horizontal,
                              //   physics: const BouncingScrollPhysics(
                              //       parent: AlwaysScrollableScrollPhysics()),
                              //   child: Row(
                              //     children: [
                              //       ...products[1].entries.map(
                              //             (softDrink) => SizedBox(
                              //               height: height * .27,
                              //               width: width * .4,
                              //               child: Padding(
                              //                 padding: const EdgeInsets.all(20),
                              //                 child: Card(
                              //                   elevation: 3,
                              //                   child: Column(
                              //                     children: [
                              //                       SizedBox(
                              //                         height: height * .17,
                              //                         child: Image.network(
                              //                           softDrink.value,
                              //                           fit: BoxFit.contain,
                              //                           height: double.infinity,
                              //                           width: double.infinity,
                              //                         ),
                              //                       ),
                              //                       Text(softDrink.key),
                              //                     ],
                              //                   ),
                              //                 ),
                              //               ),
                              //             ),
                              //           ),
                              //     ],
                              //   ),
                              // ),
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
        } else if (state is CategoryError) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Error State'),
              centerTitle: true,
            ),
            body: Center(child: Text(state.error)),
          );
        }
        return Scaffold(
          appBar: AppBar(
            title: const Text('Unknown Error State'),
            centerTitle: true,
          ),
          body: const Center(child: Text('Unknown Error')),
        );
      },
    );
  }
}
