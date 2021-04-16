part of 'bloc_new_recipe_bloc.dart';

abstract class NewRecipeEvent extends Equatable {
  const NewRecipeEvent();
}

class GetNewRecipeFromApi extends NewRecipeEvent {
  @override
  List<Object> get props => [];
}

class SearchnewRecipeFromApi extends NewRecipeEvent {
  final String search;

  SearchnewRecipeFromApi({
    this.search,
  });

  @override
  List<Object> get props => [
        search,
      ];
}
