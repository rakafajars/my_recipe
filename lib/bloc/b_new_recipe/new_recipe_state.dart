part of 'bloc_new_recipe_bloc.dart';

abstract class NewRecipeState extends Equatable {
  const NewRecipeState();
}

class NewRecipeInitial extends NewRecipeState {
  @override
  List<Object> get props => [];
}

class NewRecipeLoadInProgress extends NewRecipeState {
  @override
  List<Object> get props => [];
}

class NewRecipeLoadedSuccess extends NewRecipeState {
  final ModelNewRecipe modelNewRecipe;

  NewRecipeLoadedSuccess({
    this.modelNewRecipe,
  });
  @override
  List<Object> get props => [modelNewRecipe];
}

class NewRecipeLoadedError extends NewRecipeState {
  final String message;

  NewRecipeLoadedError({
    this.message,
  });

  @override
  List<Object> get props => [message];
}
