import 'package:flutter/material.dart';
import 'package:lab_06/src/pages/utils.dart';
import 'package:webview_flutter/webview_flutter.dart';

class FacebookPage extends StatelessWidget {
  const FacebookPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrangeAccent,
        title: crearTitulo("Facebook"),
        actions: crearAcciones(context),
      ),
      body: WebView(
        initialUrl: "https://www.facebook.com",
        javascriptMode: JavascriptMode.unrestricted,
      )
    );
  }
}
