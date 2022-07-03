import 'package:app_flutter_remeak/ui/pages/recipe/recipe_detail.dart';
import 'package:flutter/material.dart';

class SubjectContent extends StatefulWidget {
  const SubjectContent({Key? key}) : super(key: key);

  @override
  State<SubjectContent> createState() => _SubjectContentState();
}

class _SubjectContentState extends State<SubjectContent>
    with SingleTickerProviderStateMixin {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SubStatusContainer(
        key: ValueKey("SubStatusContainer"),
        counter: _counter,
        child: Column(
          children: [ShowData01(), ShowData02()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        onPressed: () {
          // setState(() {
          //   _counter++;
          // });
          // Navigator.of(context).push(PageRouteBuilder(
          //     transitionDuration: Duration(seconds: 3),
          //     pageBuilder:
          //         //Animation<double> animation 就是专场执行的过程百分比 0.0-1.0,可以直接给动画用
          //         (BuildContext context, Animation<double> animation,
          //             Animation<double> secondaryAnimation) {
          //       return FadeTransition(
          //           opacity: animation, child: RecipeDetail());
          //     }));
          // Navigator.of(context).pushNamed(RecipeDetail.ROUTE_NAME);
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return RecipeDetail();
          }));
        },
      ),
    );
  }
}

class SubStatusContainer extends InheritedWidget {
  int counter;

  SubStatusContainer({this.counter = 100, required super.child, Key? key})
      : super(key: key);

  static SubStatusContainer? of(BuildContext context) {
    //沿着Element树，往上找到最近的SubStatusContainer，从Element中取出Widget
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant SubStatusContainer oldWidget) {
    //返回true时，依赖此InheritedWidget 的stful会执行didChangeDependencies
    //返回false是，不会执行
    return oldWidget.counter != counter;
  }
}

class ShowData01 extends StatelessWidget {
  const ShowData01({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? counter = SubStatusContainer.of(context)?.counter;
    return Card(
      color: Colors.red,
      child: Text("当前计数${counter}"),
    );
  }
}

class ShowData02 extends StatefulWidget {
  const ShowData02({Key? key}) : super(key: key);

  @override
  State<ShowData02> createState() => _ShowData02State();
}

class _ShowData02State extends State<ShowData02> {
  @override
  void initState() {
    super.initState();
    print('_ShowData02State initState');
  }

  @override
  Widget build(BuildContext context) {
    int? counter = SubStatusContainer.of(context)?.counter;
    return Card(
      color: Colors.blue,
      child: Text("当前计数${counter}"),
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //当本widget依赖某个InheritedWidget的某些状态，并且InheritedWidget中的状态发生改变时，会调用
    //这里只的就是 int? counter = SubStatusContainer.of(context)?.counter; 发生变化
  }
}
