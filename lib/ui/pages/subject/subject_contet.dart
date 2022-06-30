import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SubjectContent extends StatelessWidget {
  const SubjectContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SubStatusContainer(
      child: Column(
        children: [ShowData01(), ShowData02()],
      ),
    );
  }
}

class SubStatusContainer extends InheritedWidget {
  int counter = 100;

  SubStatusContainer({required super.child});

  static SubStatusContainer? of(BuildContext context) {
    //沿着Element树，往上找到最近的InheritedWidget，从Element中取出Widget
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) {
    return false;
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

class ShowData02 extends StatelessWidget {
  const ShowData02({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int? counter = SubStatusContainer.of(context)?.counter;
    return Card(
      color: Colors.blue,
      child: Text("当前计数${counter}"),
    );
  }
}
