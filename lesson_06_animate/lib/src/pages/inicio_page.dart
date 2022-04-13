import 'package:flutter/material.dart';
import 'package:lesson_06_animate/src/pages/detalle_page.dart';

class InicioPage extends StatelessWidget {
  const InicioPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Animacion"),),
      body: GestureDetector(
        child: const Hero(
            tag: 'imageHero', 
            child: Image(
                image: AssetImage("images/pizza2.png"),
                width: 120.0,
            ) 
        ),
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetallePage();
          }));
        },
      ),
    );
  }
}
