import 'package:flutter/material.dart';

class TextFieldsPage extends StatefulWidget {
  const TextFieldsPage({Key? key}) : super(key: key);

  @override
  State<TextFieldsPage> createState() => _TextFieldsPageState();
}

class _TextFieldsPageState extends State<TextFieldsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('TextFields'),
        ),
        body: Text("Hola")
    );
  }
}

