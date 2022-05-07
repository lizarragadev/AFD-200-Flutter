import 'package:challenge_01/src/pages/challenge_01.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Challenge01(),
      debugShowCheckedModeBanner: false,
    );
  }
}
