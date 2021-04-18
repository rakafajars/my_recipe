import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/bloc/b_new_recipe/bloc_new_recipe_bloc.dart';
import 'package:food_recipe/model/m_new_recipe.dart';
import 'package:food_recipe/ui/pages/detail_recipe/detail_recipe_view.dart';
import 'package:food_recipe/ui/pages/detail_recipe/initial_detail_recipe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:shimmer/shimmer.dart';

class HomeNewRecipe extends StatefulWidget {
  final NewRecipeBloc newRecipeBloc;

  const HomeNewRecipe({
    Key key,
    this.newRecipeBloc,
  }) : super(key: key);
  @override
  _HomeNewRecipeState createState() => _HomeNewRecipeState();
}

class _HomeNewRecipeState extends State<HomeNewRecipe> {
  bool isSelectedFavorite = false;

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: sy(200),
          width: double.infinity,
          child: BlocBuilder<NewRecipeBloc, NewRecipeState>(
            builder: (context, state) {
              if (state is NewRecipeLoadInProgress) {
                return ListView.builder(
                  padding: EdgeInsets.only(
                    left: 31,
                  ),
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 8,
                      ),
                      child: Stack(
                        children: [
                          SizedBox(
                            height: sy(200),
                            width: sy(150),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(
                                  16.0,
                                ),
                                child: Container(
                                  height: sy(200),
                                  width: sy(150),
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                );
              }
              if (state is NewRecipeLoadedSuccess) {
                /// List Untuk Menampung data yang di tap
                /// untuk favorite
                List<ResultRecipe> selectedFavorite =
                    state.modelNewRecipe.results;

                return ListView.builder(
                  padding: EdgeInsets.only(
                    left: 31,
                  ),
                  shrinkWrap: true,
                  primary: false,
                  scrollDirection: Axis.horizontal,
                  itemCount: selectedFavorite.length,
                  itemBuilder: (context, int index) {
                    return Padding(
                      padding: const EdgeInsets.only(
                        right: 8,
                      ),
                      child: _newResep(
                        resultRecipe: selectedFavorite[index],
                        onChangedFavorite: (bool value) {
                          setState(
                            () {
                              if (value) {
                                selectedFavorite.add(selectedFavorite[index]);
                              }
                            },
                          );
                        },
                      ),
                    );
                  },
                );
              }
              if (state is NewRecipeLoadedError) {
                return Text(state.message);
              }
              return Container();
            },
          ),
        );
      },
    );
  }

  Widget _newResep({
    @required ResultRecipe resultRecipe,
    @required ValueChanged<bool> onChangedFavorite,
  }) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InitialDetailRecipe(
                  keyRecipe: resultRecipe.key,
                  imageUrl: resultRecipe.thumb,
                ),
              ),
            );
          },
          child: Stack(
            children: [
              Container(
                height: sy(200),
                width: sy(150),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    16.0,
                  ),
                  child: Hero(
                    tag: resultRecipe.thumb,
                    child: Image.network(
                      resultRecipe.thumb,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: sy(10),
                left: sy(100),
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
                      setState(() {
                        isSelectedFavorite = !isSelectedFavorite;
                        onChangedFavorite(isSelectedFavorite);
                      });
                    },
                    child: Icon(
                      isSelectedFavorite == false
                          ? Icons.bookmark_border_outlined
                          : Icons.bookmark,
                      size: sy(18),
                      color: Color(
                        0xFF1DA183,
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 14,
                right: 14,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(
                    12.0,
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5,
                      sigmaY: 5,
                    ),
                    child: Container(
                      height: sy(60),
                      width: sy(150),
                      decoration: BoxDecoration(
                        color: Color(0xFF141414).withOpacity(0.5),
                        borderRadius: BorderRadius.circular(
                          12.0,
                        ),
                        border: Border.all(
                          color: Colors.white.withOpacity(
                            0.15,
                          ),
                          width: 0.2,
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              left: 4,
                              right: 4,
                            ),
                            child: Text(
                              resultRecipe.key
                                  .replaceAll('-', ' ')
                                  .toUpperCase(),
                              style: GoogleFonts.nunitoSans(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 14,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Text(
                            '${resultRecipe.portion} | ${resultRecipe.dificulty}',
                            style: GoogleFonts.nunitoSans(
                              fontWeight: FontWeight.w300,
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
