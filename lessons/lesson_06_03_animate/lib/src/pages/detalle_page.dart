import 'package:flutter/material.dart';

class DetallePage extends StatelessWidget {
  const DetallePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detalle Imagen"),),
      body: GestureDetector(
        child: const Center(
          child: Hero(
            tag: 'imageHero',
            child: Image(
              image: AssetImage("images/pizza2.png"),
              width: 600.0,
            ),
          ),
        ),
        onLongPress: () {
          Navigator.pop(context);
        },
      ),
    );
  }

}
