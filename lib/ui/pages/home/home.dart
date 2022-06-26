import 'package:flutter/material.dart';
import 'home_content.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            "首页",
            style: TextStyle(fontSize: 20.sp),
          ),
        ),
      ),
      body: const HomeContent(),
    );
  }
}
