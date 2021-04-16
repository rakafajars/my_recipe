import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/model/m_new_recipe.dart';
import 'package:food_recipe/repository/r_new_recipe.dart';
import 'package:meta/meta.dart';

part 'bloc_new_recipe_event.dart';
part 'bloc_new_recipe_state.dart';

class NewRecipeBloc extends Bloc<NewRecipeEvent, NewRecipeState> {
  NewRecipeBloc({
    this.repositoryNewRecipe,
  }) : super(NewRecipeInitial());

  ModelNewRecipe _modelNewRecipe;
  final RepositoryNewRecipe repositoryNewRecipe;

  @override
  Stream<NewRecipeState> mapEventToState(
    NewRecipeEvent event,
  ) async* {
    if (event is GetNewRecipeFromApi) {
      yield NewRecipeLoadInProgress();
      try {
        _modelNewRecipe = await repositoryNewRecipe.getNewRecipe();

        yield NewRecipeLoadedSuccess(
          modelNewRecipe: _modelNewRecipe,
        );

      } catch (e) {
        yield NewRecipeLoadedError(
          message: "$e",
        );
      }
    }
  }
}
