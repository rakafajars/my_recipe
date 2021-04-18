part of 'rekomendasi_recipe_bloc.dart';

@immutable
abstract class RekomendasiRecipeState extends Equatable {
  const RekomendasiRecipeState();
}

class RekomendasiRecipeInitial extends RekomendasiRecipeState {
  @override
  List<Object> get props => [];
}


class RekomendasiRecipeLoadInProgress extends RekomendasiRecipeState {
  @override
  List<Object> get props => [];
}

class RekomendasiRecipeLoadInProgressRecipeLoadedSuccess extends RekomendasiRecipeState {
  final ModelNewRecipe modelNewRecipe;

  RekomendasiRecipeLoadInProgressRecipeLoadedSuccess({
    this.modelNewRecipe,
  });
  @override
  List<Object> get props => [modelNewRecipe];
}

class RekomendasiRecipeLoadedError extends RekomendasiRecipeState {
  final String message;

  RekomendasiRecipeLoadedError({
    this.message,
  });

  @override
  List<Object> get props => [message];
}