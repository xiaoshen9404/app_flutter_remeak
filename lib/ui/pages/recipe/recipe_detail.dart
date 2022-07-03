import 'package:flutter/material.dart';

class RecipeDetail extends StatelessWidget {
  static const String ROUTE_NAME = "/recipes/recipe_detail";

  String? msg;

  RecipeDetail({this.msg, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //使用路由映射获取值
    msg = ModalRoute.of(context)?.settings.arguments as String?;

    return WillPopScope(
      onWillPop: () {
        //设置是否允许系统返回键或者手势返回
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("菜谱详情"),
            leading: GestureDetector(
                onTap: () => Navigator.of(context).pop("详情appbar返回的参数"),
                child: Icon(Icons.arrow_back)),
          ),
          body: Column(children: [
            Text("菜谱详情"),
            ElevatedButton(
                onPressed: () => Navigator.of(context).pop("详情返回的参数"),
                child: Text("BTN")),
            Hero(
              tag: "Hero_${msg}",
              child: Container(
                width: 200,
                height: 200,
                child: Image.network(
                  msg ?? "",
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ])),
    );
  }
}
