import 'package:flutter/material.dart';

class SubjectContent extends StatefulWidget {
  const SubjectContent({Key? key}) : super(key: key);

  @override
  State<SubjectContent> createState() => _SubjectContentState();
}

class _SubjectContentState extends State<SubjectContent> {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SubStatusContainer(
        counter: _counter,
        child: Column(
          children: [ShowData01(), ShowData02()],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}

class SubStatusContainer extends InheritedWidget {
  int counter;

  SubStatusContainer({this.counter = 100, required super.child});

  static SubStatusContainer? of(BuildContext context) {
    //沿着Element树，往上找到最近的InheritedWidget，从Element中取出Widget
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant SubStatusContainer oldWidget) {
    //返回true时，依赖此InheritedWidget 的stful会执行didChangeDependencies
    //返回false是，不会执行

    return oldWidget.counter != counter;
  }
}

class ShowData01 extends StatefulWidget {
  const ShowData01({Key? key}) : super(key: key);

  @override
  State<ShowData01> createState() => _ShowData01State();
}

class _ShowData01State extends State<ShowData01> {
  @override
  Widget build(BuildContext context) {
    int? counter = SubStatusContainer.of(context)?.counter;
    return Card(
      color: Colors.red,
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

class ShowData02 extends StatefulWidget {
  const ShowData02({Key? key}) : super(key: key);

  @override
  State<ShowData02> createState() => _ShowData02State();
}

class _ShowData02State extends State<ShowData02> {
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
