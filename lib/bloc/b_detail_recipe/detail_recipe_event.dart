part of 'detail_recipe_bloc.dart';

abstract class DetailRecipeEvent extends Equatable {
  const DetailRecipeEvent();
}

class GetDetailRecipeFromApi extends DetailRecipeEvent {
  final String keyRecipe;

  GetDetailRecipeFromApi({
    @required this.keyRecipe,
  });

  @override
  List<Object> get props => [keyRecipe];
}
