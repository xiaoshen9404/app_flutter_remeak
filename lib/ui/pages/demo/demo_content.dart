import 'package:flutter/material.dart';

class DemoPageContent extends StatelessWidget {
  const DemoPageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(children: [
        GestureDetector(
          onTapDown: (detail) {
            print('out tap');
          },
          child: Container(
            width: 200,
            height: 200,
            alignment: Alignment.center,
            color: Colors.blue,
          ),
        ),
        IgnorePointer(
          child: Container(
            width: 100,
            height: 100,
            color: Colors.red,
          ),
        )
      ]),
    );
  }
}
