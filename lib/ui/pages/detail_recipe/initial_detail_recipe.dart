import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/bloc/b_detail_recipe/detail_recipe_bloc.dart';
import 'package:food_recipe/ui/pages/detail_recipe/detail_recipe_view.dart';

class InitialDetailRecipe extends StatelessWidget {
  final String keyRecipe;
  final String imageUrl;

  const InitialDetailRecipe({
    Key key,
    this.keyRecipe,
    @required this.imageUrl,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocProvider<DetailRecipeBloc>(
      create: (context) => DetailRecipeBloc()
        ..add(
          GetDetailRecipeFromApi(keyRecipe: keyRecipe),
        ),
      child: DetailRecipeView(
        imageUrl: imageUrl,
      ),
    );
  }
}
