import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/bloc/b_new_recipe/bloc_new_recipe_bloc.dart';
import 'package:food_recipe/theme/theme_color.dart';
import 'package:food_recipe/theme/theme_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:relative_scale/relative_scale.dart';
import 'package:shimmer/shimmer.dart';

class HomeRekomendasiRecioe extends StatefulWidget {
  @override
  _HomeRekomendasiRecioeState createState() => _HomeRekomendasiRecioeState();
}

class _HomeRekomendasiRecioeState extends State<HomeRekomendasiRecioe> {
  @override
  Widget build(BuildContext context) {
    return RelativeBuilder(
      builder: (context, height, width, sy, sx) {
        return Container(
          height: sy(86),
          margin: EdgeInsets.only(
            left: 31,
            right: 30,
          ),
          padding: EdgeInsets.only(
            left: 18.0,
          ),
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(1, 1), // cha
              )
            ],
            borderRadius: BorderRadius.all(
              Radius.circular(
                16.0,
              ),
            ),
          ),
          child: BlocBuilder<NewRecipeBloc, NewRecipeState>(
            builder: (context, state) {
              if (state is NewRecipeLoadInProgress) {
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SizedBox(
                      height: sy(62),
                      width: sy(60),
                      child: Shimmer.fromColors(
                        baseColor: Colors.grey[300],
                        highlightColor: Colors.grey[100],
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(
                            8.0,
                          ),
                          child: Container(
                            height: sy(62),
                            width: sy(60),
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 8,
                            ),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: Container(
                                width: double.infinity,
                                height: sy(15),
                                color: Colors.white,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              right: 16,
                            ),
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300],
                              highlightColor: Colors.grey[100],
                              child: Container(
                                width: double.infinity,
                                height: sy(8),
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              }
              if (state is NewRecipeLoadedSuccess) {
                var itemRekomendasiFirst = state.modelNewRecipe.results.last;
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      height: sy(62),
                      width: sy(60),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            itemRekomendasiFirst.thumb,
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(
                            8.0,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 24,
                    ),
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            itemRekomendasiFirst.title,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: myNunitoSans.headline6.copyWith(
                              fontWeight: FontWeight.w700,
                              fontSize: 14,
                              color: blackColor,
                            ),
                          ),
                          SizedBox(
                            height: 4,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.people,
                                    size: 12,
                                    color: blackColor.withOpacity(0.6),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    itemRekomendasiFirst.portion,
                                    style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 24,
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.access_time,
                                    size: 12,
                                    color: blackColor.withOpacity(0.6),
                                  ),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(
                                    itemRekomendasiFirst.dificulty,
                                    style: GoogleFonts.nunitoSans(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    )
                  ],
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
}
