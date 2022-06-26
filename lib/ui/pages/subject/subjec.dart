import 'package:app_flutter_remeak/ui/pages/subject/subject_contet.dart';
import 'package:flutter/material.dart';

class SubjectPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subject")),
      body: SubjectContent(),
    );
  }
}
