import 'package:flutter/material.dart';
import 'package:lab_06/src/pages/utils.dart';
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
        body: WebView(
          initialUrl: "https://www.twitter.com",
          javascriptMode: JavascriptMode.unrestricted,
        )
    );
  }
}
