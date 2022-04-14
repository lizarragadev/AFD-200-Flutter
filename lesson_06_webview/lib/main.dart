import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'WebView Demo',
      home: MyWebView(),
    );
  }
}

class MyWebView extends StatelessWidget {
  const MyWebView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('WebView'),
        ),
        body: WebView(
          initialUrl: 'https://flutter.dev',
          javascriptMode: JavascriptMode.unrestricted,
          onProgress: (progress) {
            print("========= $progress % ==========");
          },
          onWebResourceError: (WebResourceError e) {
            print("++++++++++++ Error ${e.errorCode} ++++++++++++");
          },
        )
    );
  }
}
