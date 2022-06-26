import 'package:app_flutter_remeak/widgets/custom_star_rating.dart';
import 'package:app_flutter_remeak/widgets/dashed_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          //... other code
          builder: (context, widget) {
            //add this line
            // ScreenUtil.setContext(context);
            return MediaQuery(
              //Setting font does not change with system font size
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: widget!,
            );
          },
          theme: ThemeData(
            textTheme: TextTheme(
                //要支持下面这个需要使用第一种初始化方式
                button: TextStyle(fontSize: 45.sp)),
          ),
          home: const HomePage(),
        );
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "首页",
            style: TextStyle(fontSize: 20),
          ),
        ),
        body: Center(
          child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CustomStarRating(totalRating: 7, rating: 3.7),
                Container(
                  width: 200.w,
                  child: DashedLine(
                    count: 20,
                    dashedWidth: 5.w,
                    dashedHeight: 1.h,
                    borderRadius: BorderRadius.all(Radius.circular(3.r)),
                  ),
                )
              ]),
        ));
  }
}
