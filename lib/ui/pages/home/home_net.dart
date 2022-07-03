import 'package:dio/dio.dart';

import '../../../net/http_request.dart';
import 'beans/data_recipe.dart';

class HomeRequest {
  static const movieUrl = "/supor-food-oss/foodTRecipe/pageList";

  static Future<List<RecipeRows>> requestMovieList(String recipeStatus,
      String recipeType, String providerId, int limit, int page) async {
    dynamic value = await HttpRequest.getRequest(movieUrl, queryParameters: {
      "recipeStatus": recipeStatus,
      "recipeType": recipeType,
      "providerId": providerId,
      "limit": limit,
      "page": page,
    });
    RecipeListBean recipeListBean = RecipeListBean.fromJson(value.data);
    return recipeListBean.data?.rows ?? [];
  }
}
