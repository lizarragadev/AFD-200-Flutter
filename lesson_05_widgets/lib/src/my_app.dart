
import 'package:flutter/material.dart';
import 'package:lesson_05_widgets/src/pages/widgets_page.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WidgetsPage(),
    );
  }
}
