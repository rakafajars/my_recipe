import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/bloc/b_detail_recipe/detail_recipe_bloc.dart';
import 'package:food_recipe/model/m_new_recipe.dart';
import 'package:food_recipe/theme/theme_color.dart';
import 'package:food_recipe/theme/theme_text.dart';
import 'package:food_recipe/ui/pages/detail_recipe/detail_informasi_recipe.dart';
import 'package:food_recipe/ui/pages/detail_recipe/detail_ingredients_recipe.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:shimmer/shimmer.dart';

import 'detail_directions_recipe.dart';

class DetailRecipeView extends StatefulWidget {
  final String imageUrl;

  const DetailRecipeView({Key key, this.imageUrl}) : super(key: key);

  @override
  _DetailRecipeViewState createState() => _DetailRecipeViewState();
}

class _DetailRecipeViewState extends State<DetailRecipeView> {
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          body: BlocBuilder<DetailRecipeBloc, DetailRecipeState>(
            builder: (context, state) {
              if (state is DetailRecipeLoadInProgress) {
                return Stack(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: sy(256),
                          width: double.infinity,
                          child: Shimmer.fromColors(
                            baseColor: Colors.grey[300],
                            highlightColor: Colors.grey[100],
                            child: Container(
                              height: sy(256),
                              width: double.infinity,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SafeArea(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 14,
                              left: 24,
                              right: 24,
                            ),
                            child: Container(
                              height: sy(36),
                              width: sy(36),
                              decoration: BoxDecoration(
                                color: Color.fromRGBO(
                                  15,
                                  15,
                                  17,
                                  0.5,
                                ),
                                shape: BoxShape.circle,
                              ),
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Icon(
                                  Icons.arrow_back_outlined,
                                  size: 18,
                                  color: whiteColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    DraggableScrollableSheet(
                      initialChildSize: 0.6,
                      minChildSize: 0.6,
                      maxChildSize: 1,
                      builder: (BuildContext context, myscrollController) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                24,
                              ),
                              topRight: Radius.circular(
                                24,
                              ),
                            ),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 155,
                                  right: 155,
                                ),
                                child: Divider(
                                  thickness: 2,
                                  color: Color(0xFF0F0F11).withOpacity(
                                    0.3,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: CircularProgressIndicator(
                                    backgroundColor: grenColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
              if (state is DetailRecipeLoadedSuccess) {
                return Stack(
                  children: [
                    Stack(
                      children: [
                        state.modelDetailRecipe.results.thumb != null
                            ? Image.network(
                                state.modelDetailRecipe.results.thumb ?? '',
                                height: sy(256),
                                width: double.infinity,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                height: sy(256),
                                width: double.infinity,
                                child: Icon(
                                  Icons.image_not_supported,
                                  color: Colors.grey,
                                  size: 24,
                                ),
                              ),
                        SafeArea(
                          child: Padding(
                            padding: EdgeInsets.only(
                              top: 14,
                              left: 24,
                              right: 24,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  height: sy(36),
                                  width: sy(36),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                      15,
                                      15,
                                      17,
                                      0.5,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                    child: Icon(
                                      Icons.arrow_back_outlined,
                                      size: 18,
                                      color: whiteColor,
                                    ),
                                  ),
                                ),
                                Container(
                                  height: sy(36),
                                  width: sy(36),
                                  decoration: BoxDecoration(
                                    color: Color.fromRGBO(
                                      15,
                                      15,
                                      17,
                                      0.5,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        isSelected = !isSelected;
                                      });
                                    },
                                    child: Icon(
                                      isSelected != false
                                          ? Icons.bookmark
                                          : Icons.bookmark_border_outlined,
                                      size: sy(18),
                                      color: Color(
                                        0xFF1DA183,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    DraggableScrollableSheet(
                      initialChildSize: 0.6,
                      minChildSize: 0.6,
                      maxChildSize: 1,
                      builder: (BuildContext context, myscrollController) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(
                                24,
                              ),
                              topRight: Radius.circular(
                                24,
                              ),
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 155,
                                  right: 155,
                                ),
                                child: Divider(
                                  thickness: 2,
                                  color: Color(0xFF0F0F11).withOpacity(
                                    0.3,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: ListView(
                                  padding: EdgeInsets.only(
                                    bottom: 8,
                                  ),
                                  controller: myscrollController,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(
                                        left: 31,
                                        right: 31,
                                      ),
                                      child: Text(
                                        state.modelDetailRecipe.results.title,
                                        style: myHalant.subtitle2.copyWith(
                                          fontWeight: FontWeight.w600,
                                          fontStyle: FontStyle.normal,
                                          fontSize: 28,
                                          color: blackColor,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),

                                    /// Informasi Masak
                                    DetailInformasiRecipe(
                                      modelDetailRecipe:
                                          state.modelDetailRecipe,
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),

                                    /// Menu Resep
                                    DetailIngredientsRecipe(
                                      modelDetailRecipe:
                                          state.modelDetailRecipe,
                                    ),
                                    SizedBox(
                                      height: 24,
                                    ),

                                    /// Cara Masak
                                    DetailDirectionsRecipe(
                                      modelDetailRecipe:
                                          state.modelDetailRecipe,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                );
              }
              if (state is DetailRecipeLoadedError) {
                return Text(
                  state.message,
                );
              }
              return Container();
            },
          ),
        );
      },
    );
  }
}
