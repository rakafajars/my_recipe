part of 'rekomendasi_recipe_bloc.dart';

abstract class RekomendasiRecipeEvent extends Equatable {
  const RekomendasiRecipeEvent();
}

class GetRekomendasiRecipeFromApi extends RekomendasiRecipeEvent {
  @override
  List<Object> get props => [];
}
