import 'dart:ui';
import 'package:jobswire/pages/job_list_pages.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffff9500),
        body: JobListPage(),
      ),
    );
  }
}
