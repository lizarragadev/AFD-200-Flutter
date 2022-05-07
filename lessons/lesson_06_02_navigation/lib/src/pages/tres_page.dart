import 'package:flutter/material.dart';

class TresPage extends StatelessWidget {
  String valor = "";
  TresPage({Key? key, required this.valor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina Tres"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Valor recibido: $valor"),
              const SizedBox(height: 30.0,),
              OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Volver")
              )
            ],
          )
      ),
    );
  }
}
