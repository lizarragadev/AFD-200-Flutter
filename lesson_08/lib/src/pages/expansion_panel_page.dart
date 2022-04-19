import 'package:flutter/material.dart';

class ExpansionPanelPage extends StatelessWidget {
  const ExpansionPanelPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Expansion Panel & SnackBar'),
        ),
        body: Text("Hola")
    );
  }
}
