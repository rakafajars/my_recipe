import 'package:food_recipe/model/m_new_recipe.dart';

abstract class Repository {
  Future<ModelNewRecipe> getNewRecipe() {}
}
