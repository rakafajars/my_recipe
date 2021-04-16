import 'package:dio/dio.dart';
import 'package:food_recipe/model/m_new_recipe.dart';
import 'package:food_recipe/network/dio_client.dart';
import 'package:food_recipe/network/network_error.dart';

class RepositoryNewRecipe {
  Dio get dio => dioClient();

  Future<ModelNewRecipe> getNewRecipe() async {
    try {
      Response response = await dio.get(
        'api/recipes',
      );

      print(response.data);
      return ModelNewRecipe.fromJson(
        response.data,
      );
    } catch (error, stacktrace) {
      throw showException(error, stacktrace);
    }
  }
}
