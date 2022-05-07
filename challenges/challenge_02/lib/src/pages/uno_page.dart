import 'package:flutter/material.dart';

class UnoPage extends StatelessWidget {
  const UnoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Título al centro"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Image(
                image: NetworkImage(
                  "https://empresas.blogthinkbig.com/wp-content/uploads/2019/11/Imagen3-245003649.jpg?w=800",
                )
            ),
            SizedBox(height: 20,),
            Text(
              "En el arte de la pintura, el diseño gráfico, el diseño visual, la fotografía, la imprenta y en la televisión, la teoría del color es un grupo de reglas básicas en la mezcla de colores para lograr el efecto deseado combinando colores de luz o pigmento. La luz blanca se puede producir combinando el rojo, el verde y el azul, mientras que combinando pigmentos cian, magenta y amarillo se produce el color negro.",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
      ),
    );
  }
}
