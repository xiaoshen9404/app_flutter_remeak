import 'package:flutter/cupertino.dart';

class MainBottomBar extends BottomNavigationBarItem {
  MainBottomBar(String iconImgName, [String? title])
      : super(
            icon: Image.asset("images/$iconImgName.png", width: 32, height: 32),
            activeIcon: Image.asset("images/${iconImgName}_active.png",
                width: 32, height: 32),
            label: title);
}
