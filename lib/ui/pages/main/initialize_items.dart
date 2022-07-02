import 'package:app_flutter_remeak/ui/pages/home/home.dart';
import 'package:app_flutter_remeak/ui/pages/mine/mine.dart';
import 'package:flutter/cupertino.dart';
import '../subject/subjec.dart';
import 'bottom_bar_item.dart';

List<BottomNavigationBarItem> nvItems = [
  MainBottomBar("home", "首页"),
  MainBottomBar("subject", "书影音"),
  MainBottomBar("group", "小组"),
  MainBottomBar("mall", "市集"),
  MainBottomBar("profile", "我的"),
];

List<Widget> pages = [
  HomePage(),
  SubjectPage(),
  HomePage(),
  HomePage(),
  MinePage(),
];
