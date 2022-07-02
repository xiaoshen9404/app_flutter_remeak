import 'package:app_flutter_remeak/ui/pages/main/main_page.dart';
import 'package:app_flutter_remeak/viewmodel/counter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

void main() {
  // runApp(MyApp());
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) {
          //       创建共享数据 记得一定要return
          return CounterViewModel();
        },
      )
    ],
    child: MyApp(),
  ));
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
              primarySwatch: Colors.blue,
              splashColor: Colors.transparent),
          home: MainPage(),
        );
      },
    );
  }
}
