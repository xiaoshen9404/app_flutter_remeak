import 'package:app_flutter_remeak/events/event_bus_ex.dart';
import 'package:flutter/material.dart';

class EventBusDemo extends StatelessWidget {
  const EventBusDemo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [EventButton(), EventText()],
    );
  }
}

class EventButton extends StatelessWidget {
  const EventButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //2.发送事件
        eventBus.fire(TextChangeEvent(msg: "hello bro"));
      },
      child: Text("BTN"),
    );
  }
}

class EventText extends StatefulWidget {
  const EventText({Key? key}) : super(key: key);

  @override
  State<EventText> createState() => _EventTextState();
}

class _EventTextState extends State<EventText> {
  String? message = "change txt";

  @override
  void initState() {
    super.initState();
    //3.在initState中监听事件
    eventBus.on<TextChangeEvent>().listen((event) {
      print(event.msg);
      setState(() {
        message = event.msg;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(message ?? "");
  }
}
