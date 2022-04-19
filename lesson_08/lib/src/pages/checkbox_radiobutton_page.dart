import 'package:flutter/material.dart';

class CheckBoxRadioButtonPage extends StatefulWidget {
  const CheckBoxRadioButtonPage({Key? key}) : super(key: key);

  @override
  State<CheckBoxRadioButtonPage> createState() => _CheckBoxRadioButtonPageState();
}

class _CheckBoxRadioButtonPageState extends State<CheckBoxRadioButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CheckBox & RadioButtons'),
        ),
        body: Text("Hola")
    );
  }

}
