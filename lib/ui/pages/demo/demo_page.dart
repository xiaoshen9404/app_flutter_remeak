import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'demo_content.dart';
import 'event_bus_demo.dart';

class DemoPage extends StatelessWidget {
  const DemoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: EventBusDemo(),
    );
  }
}
