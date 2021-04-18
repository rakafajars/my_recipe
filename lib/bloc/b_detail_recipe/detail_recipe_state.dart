part of 'detail_recipe_bloc.dart';

abstract class DetailRecipeState extends Equatable {
  const DetailRecipeState();
}

class DetailRecipeInitial extends DetailRecipeState {
  @override
  List<Object> get props => [];
}

class DetailRecipeLoadInProgress extends DetailRecipeState {
  @override
  List<Object> get props => [];
}

class DetailRecipeLoadedSuccess extends DetailRecipeState {
  final ModelDetailRecipe modelDetailRecipe;

  DetailRecipeLoadedSuccess({
    @required this.modelDetailRecipe,
  });

  @override
  List<Object> get props => [modelDetailRecipe];
}

class DetailRecipeLoadedError extends DetailRecipeState {
  final String message;

  DetailRecipeLoadedError({this.message});

  @override
  List<Object> get props => [message];
}
