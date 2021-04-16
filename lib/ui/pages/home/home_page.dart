import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/bloc/b_new_recipe/bloc_new_recipe_bloc.dart';
import 'package:food_recipe/theme/theme_color.dart';
import 'package:food_recipe/theme/theme_text.dart';
import 'package:food_recipe/ui/pages/home/home_new_recipe.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relative_scale/relative_scale.dart';

import 'home_rekomendasi_recipe.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController _searchRecipe = TextEditingController();

  NewRecipeBloc _newRecipeBloc;

  @override
  void initState() {
    _newRecipeBloc = BlocProvider.of<NewRecipeBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _searchRecipe.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Scaffold(
          backgroundColor: whiteColor,
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.only(
                bottom: 16,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 30,
                      left: 31,
                    ),
                    child: Icon(
                      Icons.notes_outlined,
                      size: 24,
                      color: Colors.black,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 24,
                      left: 31,
                    ),
                    child: Text(
                      'Mau Masak Apa\nHari Ini ?',
                      style: myHalant.headline6.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 28,
                        color: blackColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  /// Search Widget
                  Container(
                    margin: EdgeInsets.only(
                      left: 31,
                      right: 31,
                    ),
                    decoration: BoxDecoration(
                      color: whiteColor1,
                      borderRadius: BorderRadius.all(
                        Radius.circular(
                          16.0,
                        ),
                      ),
                    ),
                    child: TextFormField(
                      controller: _searchRecipe,
                      onChanged: (newValue) {
                        if (newValue.length >= 3) {
                          _newRecipeBloc
                            ..add(
                              SearchnewRecipeFromApi(
                                search: newValue,
                              ),
                            );
                        }
                        if (newValue.isEmpty) {
                          _newRecipeBloc
                            ..add(
                              GetNewRecipeFromApi(),
                            );
                        }
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        prefixIcon: Icon(
                          Icons.search_sharp,
                          size: 14,
                          color: blackColor.withOpacity(
                            0.6,
                          ),
                        ),
                        hintText: 'Cari Resep Favorit Kamu',
                        hintStyle: myNunitoSans.headline3.copyWith(
                          fontSize: 14,
                          color: blackColor.withOpacity(
                            0.6,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  /// Menu Makanan
                  Padding(
                    padding: EdgeInsets.only(
                      left: 31,
                    ),
                    child: Text(
                      'Resep Terbaru',
                      style: myHalant.headline6.copyWith(
                        fontWeight: FontWeight.w600,
                        fontSize: 22,
                        fontStyle: FontStyle.normal,
                        color: blackColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),

                  /// Resep Terbaru
                  HomeNewRecipe(
                    newRecipeBloc: _newRecipeBloc,
                  ),

                  SizedBox(
                    height: 14,
                  ),

                  /// Rekomendasi Resep
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 31,
                      right: 30,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Text(
                          'Rekomendasi',
                          style: myHalant.headline6.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 22,
                            color: blackColor,
                          ),
                        ),
                        Text(
                          'Lihat Semua',
                          style: myHalant.headline6.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: grenColor1,
                          ),
                        ),
                      ],
                    ),
                  ),
                  HomeRekomendasiRecioe(),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
