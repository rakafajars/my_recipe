import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/model/m_new_recipe.dart';
import 'package:food_recipe/network/api_service.dart';
import 'package:food_recipe/network/repository.dart';
import 'package:meta/meta.dart';

part 'rekomendasi_recipe_event.dart';
part 'rekomendasi_recipe_state.dart';

class RekomendasiRecipeBloc
    extends Bloc<RekomendasiRecipeEvent, RekomendasiRecipeState> {
  RekomendasiRecipeBloc() : super(RekomendasiRecipeInitial());

  ModelNewRecipe _modelNewRecipe;
  Repository _repository = ApiService();

  @override
  Stream<RekomendasiRecipeState> mapEventToState(
    RekomendasiRecipeEvent event,
  ) async* {
    if (event is GetRekomendasiRecipeFromApi) {
      yield RekomendasiRecipeLoadInProgress();
      try {
        _modelNewRecipe = await _repository.getRekomendasiRecipe();

        yield RekomendasiRecipeLoadInProgressRecipeLoadedSuccess(
          modelNewRecipe: _modelNewRecipe,
        );
      } catch (e) {
        yield RekomendasiRecipeLoadedError(
          message: "$e",
        );
      }
    }
  }
}
