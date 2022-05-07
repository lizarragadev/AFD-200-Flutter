import 'package:flutter/material.dart';
import 'package:lab_06/src/widgets/utils.dart';
import 'package:lab_06/src/widgets/webview_base.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TwitterPage extends StatelessWidget {
  const TwitterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: crearTitulo("Twitter"),
          actions: crearAcciones(context),
        ),
        body: const WebViewBase("www.twitter.com")
    );
  }
}
