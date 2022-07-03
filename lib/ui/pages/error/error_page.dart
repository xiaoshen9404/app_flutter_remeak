import 'package:flutter/cupertino.dart';

class ErrorPage extends StatelessWidget {
  static const String ROUTE_NAME = "/common/errorpage";

  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Error_page"),
    );
  }
}
