import 'dart:ui';

import 'package:flutter/material.dart';

import 'initialize_items.dart';

class MainPage extends StatefulWidget {
  static const String ROUTE_NAME="/";
  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    //获取物理分辨率
    final physicalWidth = window.physicalSize.width;
    final physicalHeight = window.physicalSize.height;
    print('物理分辨率 $physicalWidth * $physicalHeight');

    //获取逻辑分辨率
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    print('屏幕宽高 $width * $height');

    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: nvItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
