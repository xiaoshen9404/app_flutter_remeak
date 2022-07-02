import 'package:app_flutter_remeak/viewmodel/counter_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MinePageContet extends StatelessWidget {
  const MinePageContet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [ShowData01(), ShowData02()],
        ),
      ),
    );
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
    return Selector<CounterViewModel, CounterViewModel>(
      builder: (context, value, child) {
        return Card(
          color: Colors.blue,
          child: Text("当前计数${value.counter}"),
        );
      },
      //selector可以将以个model转成其他的model，这里我们不需要转换，直接返回原来的model即可
      selector: (BuildContext context, CounterViewModel value) => value,
      shouldRebuild: (CounterViewModel previous, CounterViewModel next) {
        //判断 previous/next 前后两个值的状态，决定是否要rebuild
        return false;
      },
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
    return Consumer<CounterViewModel>(
      builder: (BuildContext context, value, Widget? child) {
        return Card(
          color: Colors.blue,
          child: Text("当前计数${value.counter}"),
        );
      },
    );
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    //当本widget依赖某个InheritedWidget的某些状态，并且InheritedWidget中的状态发生改变时，会调用
    //这里只的就是 int? counter = SubStatusContainer.of(context)?.counter; 发生变化
  }
}
