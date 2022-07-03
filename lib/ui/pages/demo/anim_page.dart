import 'package:flutter/material.dart';

class AnimPage extends StatefulWidget {
  AnimPage({Key? key}) : super(key: key);

  @override
  State<AnimPage> createState() => _AnimPageState();
}

class _AnimPageState extends State<AnimPage>
    with SingleTickerProviderStateMixin {
  Animation<double>? _sizeAnimation;
  AnimationController? _animationController;

  @override
  void initState() {
    super.initState();

    //1.创建 AnimationController
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
      //要使用CurvedAnimation，起止值必须是0.0 - 1.0，可以直接不写
      // lowerBound: 50,
      // upperBound: 150
    );

    //2.创建变速器
    Animation<double> _animation = CurvedAnimation(
        parent: _animationController!, curve: Curves.elasticInOut);

    //3.创建变化值
    _sizeAnimation = Tween(begin: 50.0, end: 150.0)
        //.animate 表示动画控制器是谁，要同时启动多个动画时，只要将多个动画都设置成同一个animate就行
        .animate(_animation);

    //添加监听
    // _animationController!.addListener(() {
    //   setState(() {});
    // });
    //添加状态改变监听
    _animationController!.addStatusListener((status) {
      print(status);
      if (status == AnimationStatus.completed) {
        //正向执行完成后反向执行
        _animationController?.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //反向执行动画后，状态不会返回completed，而是返回dismissed
        //dismissed表示动画恢复到了初始状态
        //此时可以重新执行
        _animationController?.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Anim"),
      ),
      floatingActionButton: FloatingActionButton(
        heroTag: null,
        child: Icon(Icons.play_arrow),
        onPressed: () {
          //动画的暂停和继续
          if (_animationController!.isAnimating) {
            _animationController?.stop();
          } else {
            if (_animationController?.status == AnimationStatus.reverse) {
              _animationController?.reverse();
            } else {
              _animationController?.forward();
            }
          }
        },
      ),
      body: Center(
        child: AnimatedBuilder(
          animation: _animationController!,
          //builder属性中的 Widget? child 来自于 AnimatedBuilder的child参数
          builder: (BuildContext context, Widget? child) {
            return Icon(
              Icons.favorite,
              color: Colors.red,
              size: _sizeAnimation?.value,
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    //销毁动画
    _animationController?.dispose();
    super.dispose();
  }
}

class AnimationIcon extends AnimatedWidget {
  AnimationIcon(Animation animation) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Icon(
      Icons.favorite,
      color: Colors.red,
      size: (listenable as Animation).value,
    );
  }
}
