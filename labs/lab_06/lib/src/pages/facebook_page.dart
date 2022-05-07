import 'package:flutter/material.dart';
import 'package:lab_06/src/widgets/utils.dart';
import 'package:lab_06/src/widgets/webview_base.dart';

class FacebookPage extends StatefulWidget {
  const FacebookPage({Key? key}) : super(key: key);
  @override
  State<FacebookPage> createState() => _FacebookPageState();
}

class _FacebookPageState extends State<FacebookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepOrangeAccent,
          title: crearTitulo("Facebook"),
          actions: crearAcciones(context),
        ),
        body: const WebViewBase("www.facebook.com")
    );
  }
}

