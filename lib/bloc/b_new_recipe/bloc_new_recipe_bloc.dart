import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/model/m_new_recipe.dart';
import 'package:food_recipe/network/api_service.dart';
import 'package:food_recipe/network/repository.dart';

part 'bloc_new_recipe_event.dart';
part 'bloc_new_recipe_state.dart';

class NewRecipeBloc extends Bloc<NewRecipeEvent, NewRecipeState> {
  NewRecipeBloc() : super(NewRecipeInitial());

  ModelNewRecipe _modelNewRecipe;
  Repository _repository = ApiService();

  @override
  Stream<NewRecipeState> mapEventToState(
    NewRecipeEvent event,
  ) async* {
    if (event is GetNewRecipeFromApi) {
      yield NewRecipeLoadInProgress();
      try {
        _modelNewRecipe = await _repository.getNewRecipe();

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
