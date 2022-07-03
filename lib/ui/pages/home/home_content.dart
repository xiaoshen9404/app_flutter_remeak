import 'dart:convert';
import 'dart:math';

import 'package:app_flutter_remeak/ui/pages/home/beans/data_recipe.dart';
import 'package:app_flutter_remeak/ui/pages/home/recipe_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'home_net.dart';

class HomeContent extends StatefulWidget {
  const HomeContent({Key? key}) : super(key: key);

  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  List<RecipeRows>? _recipeListBean;

  @override
  void initState() {
    super.initState();
    HomeRequest.requestMovieList("RELEASE", "VIDEO", "0", 20, 1).then((value) {
      // var data= jsonDecode(value);
      // print(value.data.runtimeType);
      setState(() {
        _recipeListBean = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverList(
            delegate: SliverChildBuilderDelegate(
                childCount: _recipeListBean?.length ?? 0,
                (BuildContext context, int index) {
          RecipeRows? recipeRows = _recipeListBean?[index];

          return RecipeItemView(index + 1, recipeRows);
        }))
      ],
    );
  }
}
