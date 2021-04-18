import 'package:food_recipe/model/m_detail_recipe.dart';
import 'package:food_recipe/model/m_new_recipe.dart';

abstract class Repository {
  Future<ModelNewRecipe> getNewRecipe();

  Future<ModelNewRecipe> searchNewRecipe({
    String search,
  });

  Future<ModelNewRecipe> getRekomendasiRecipe();

  Future<ModelDetailRecipe> getDetailRecipe({
    String keyRecipe,
  });
}
