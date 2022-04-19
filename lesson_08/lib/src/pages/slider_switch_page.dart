import 'package:flutter/material.dart';

class SliderSwitchPage extends StatefulWidget {
  const SliderSwitchPage({Key? key}) : super(key: key);

  @override
  State<SliderSwitchPage> createState() => _SliderSwitchPageState();
}

class _SliderSwitchPageState extends State<SliderSwitchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider & Switch'),
        ),
        body: Text("Hola")
    );
  }
}
