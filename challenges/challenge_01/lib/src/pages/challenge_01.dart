import 'package:flutter/material.dart';

class Challenge01 extends StatefulWidget {
  const Challenge01({Key? key}) : super(key: key);

  @override
  State<Challenge01> createState() => _Challenge01State();
}

class _Challenge01State extends State<Challenge01> {
  final estiloTexto = const TextStyle(fontSize: 130, fontWeight: FontWeight.bold);
  int codigoLetra = 65;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Challenge #1"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(String.fromCharCode(codigoLetra), style: estiloTexto)
          ],
        ),
      ),
      floatingActionButton: _crearBotones(),
    );
  }

  Widget _crearBotones() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        FloatingActionButton(onPressed: _anterior, child: const Icon(Icons.arrow_back_ios)),
        const SizedBox(width: 10.0),
        FloatingActionButton(onPressed: _siguiente, child: const Icon(Icons.arrow_forward_ios))
      ],
    );
  }

  void _siguiente() => setState(() { (codigoLetra != 90) ? codigoLetra++ : codigoLetra = 65; });

  void _anterior() => setState(() {(codigoLetra != 65) ? codigoLetra-- : codigoLetra = 90; });

}
