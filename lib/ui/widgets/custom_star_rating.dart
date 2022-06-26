import 'package:flutter/material.dart';

/// 评分条 */
class CustomStarRating extends StatefulWidget {
  double starSize;
  int starCount;
  double rating; //分数
  int totalRating; //总分
  Color starColor;
  Color starBorderColor;
  Widget unSelectWidget;
  Widget selectWidget;

  CustomStarRating({
    this.starCount = 5,
    this.rating = 10,
    this.totalRating = 10,
    this.starColor = const Color(0xffff0000),
    this.starBorderColor = const Color(0xffa9a9a9),
    this.starSize = 30,
    Widget? unSelect,
    Widget? select,
  })  : this.unSelectWidget = unSelect ??
            Icon(
              Icons.star,
              color: starBorderColor,
              size: starSize,
            ),
        this.selectWidget = select ??
            Icon(
              Icons.star,
              color: starColor,
              size: starSize,
            );

  @override
  State<CustomStarRating> createState() => _CustomStarRatingState();
}

class _CustomStarRatingState extends State<CustomStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: buildUnselectStar()),
        Row(mainAxisSize: MainAxisSize.min, children: buildselectStar()),
      ],
    );
  }

  List<Widget> buildUnselectStar() {
    return List.generate(widget.starCount, (index) {
      return widget.unSelectWidget;
    });
  }

  List<Widget> buildselectStar() {
    //每颗星对应多少分数
    double oneStarProgress = widget.totalRating / widget.starCount;
    //当前分数对应多少星，整数部分
    int starProgress = widget.rating ~/ oneStarProgress;
    //剩余分数占 一颗星的百分比
    double surplusProportion =
        (widget.rating % oneStarProgress) / oneStarProgress;

    //添加整数部分的星
    List<Widget> stars = List.generate(starProgress, (index) {
      return widget.selectWidget;
    });

    //添加小数部分的星
    if (surplusProportion != 0) {
      //裁剪星星
      ClipRect clipStar = ClipRect(
        child: widget.selectWidget,
        clipper: StarCliper(showProportion: surplusProportion),
      );
      stars.add(clipStar);
    }
    return stars;
  }
}

class StarCliper extends CustomClipper<Rect> {
  //展示部分的百分比
  double showProportion;

  StarCliper({@required this.showProportion = 1});

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, size.width * showProportion, size.height);
  }

  /**
   * 是否需要重新裁剪
   */
  @override
  bool shouldReclip(StarCliper oldClipper) {
    //当占比发生变化时，才需要裁剪
    return oldClipper.showProportion != this.showProportion;
  }
}
