import 'package:flutter/material.dart';

class LightTheme {
  static ThemeData themeData = ThemeData(
    brightness: Brightness.light,
    //1.primarySwatch传入的是MaterialColor
    splashColor: Colors.transparent,
    //2.primarySwatch 设置主色
    primarySwatch: Colors.blue,
    //3.单独设置导航和TabBar
    primaryColor: Colors.orange,
    //4.单独设置FloatingActionButton/switch,已弃用
    // accentColor: Colors.green

    //5.设置Button主题
    buttonTheme: const ButtonThemeData(
      height: 25,
      minWidth: 10,
    ),
    //6.卡片主题
    cardTheme: CardTheme(elevation: 10),
    // 7.文字主题 Material文本默认用bodyText2
    textTheme: const TextTheme(
      bodyText2: TextStyle(
        fontSize: 16,
        color: Colors.black,
      ),
    ),
  );
}
