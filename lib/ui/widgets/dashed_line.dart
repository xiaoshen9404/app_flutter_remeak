import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final Axis axis;
  final double dashedWidth;
  final double dashedHeight;
  final int count;
  final Color color;
  final BorderRadius? borderRadius;

  DashedLine({
    this.axis = Axis.horizontal,
    this.dashedWidth = 0,
    this.dashedHeight = 0,
    this.count = 0,
    this.color = Colors.black,
    this.borderRadius,
  });

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: axis,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(count, (index) {
        return SizedBox(
            width: dashedWidth,
            height: dashedHeight,
            child: DecoratedBox(
              decoration:
                  BoxDecoration(color: color, borderRadius: borderRadius),
            ));
      }),
    );
  }
}
