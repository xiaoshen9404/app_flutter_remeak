import 'package:app_flutter_remeak/ui/pages/main/main_page.dart';
import 'package:app_flutter_remeak/ui/pages/recipe/recipe_detail.dart';
import 'package:flutter/material.dart';

import '../ui/pages/error/error_page.dart';

class AppRouter {
  //映射表
  static final Map<String, WidgetBuilder> routes = {
    ErrorPage.ROUTE_NAME: (context) => ErrorPage(),
    MainPage.ROUTE_NAME: (context) => MainPage(),
    RecipeDetail.ROUTE_NAME: (context) => RecipeDetail(),
  };

  //默认路由
  static const String initialRoute = MainPage.ROUTE_NAME;

  //路由生成器，用于兼容
  static final RouteFactory generateRoute = (RouteSettings settings) {
    if (settings.name == RecipeDetail.ROUTE_NAME) {
      return MaterialPageRoute(builder: (BuildContext context) {
        return RecipeDetail(msg: settings.arguments as String?);
      });
    }
    return null;
  };

  //处理未知路由
  static final RouteFactory onUnknownRoute = (RouteSettings settings) {
    //路由跳转的路径不存在时，执行此方法,让我们指向另一个路径，比如统一的错误页面
    return MaterialPageRoute(builder: (BuildContext context) => ErrorPage());
  };
}
