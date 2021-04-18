import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_recipe/model/m_detail_recipe.dart';
import 'package:food_recipe/network/api_service.dart';
import 'package:food_recipe/network/repository.dart';
import 'package:meta/meta.dart';

part 'detail_recipe_event.dart';
part 'detail_recipe_state.dart';

class DetailRecipeBloc extends Bloc<DetailRecipeEvent, DetailRecipeState> {
  DetailRecipeBloc() : super(DetailRecipeInitial());

  ModelDetailRecipe _modelDetailRecipe;
  Repository _repository = ApiService();

  @override
  Stream<DetailRecipeState> mapEventToState(
    DetailRecipeEvent event,
  ) async* {
    if (event is GetDetailRecipeFromApi) {
      yield DetailRecipeLoadInProgress();
      try {
        _modelDetailRecipe = await _repository.getDetailRecipe(
          keyRecipe: event.keyRecipe,
        );

        yield DetailRecipeLoadedSuccess(
          modelDetailRecipe: _modelDetailRecipe,
        );

      } catch (e) {
        yield DetailRecipeLoadedError(
          message: "$e",
        );
      }
    }
  }
}
