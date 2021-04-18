import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_recipe/bloc/b_new_recipe/bloc_new_recipe_bloc.dart';
import 'package:food_recipe/bloc/b_rekomendasi_recipe/rekomendasi_recipe_bloc.dart';
import 'package:food_recipe/ui/pages/home/home_page.dart';

class InitialHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewRecipeBloc>(
          create: (context) => NewRecipeBloc()
            ..add(
              GetNewRecipeFromApi(),
            ),
        ),
        BlocProvider<RekomendasiRecipeBloc>(
          create: (context) => RekomendasiRecipeBloc()
            ..add(
              GetRekomendasiRecipeFromApi(),
            ),
        )
      ],
      child: HomePage(),
    );
  }
}
