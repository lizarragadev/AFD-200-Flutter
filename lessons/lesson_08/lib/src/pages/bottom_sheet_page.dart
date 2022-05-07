import 'package:flutter/material.dart';

class BottomSheetPage extends StatelessWidget {
  BottomSheetPage({Key? key}) : super(key: key);

  final _key = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _key,
        appBar: AppBar(
          title: const Text('Bottom Sheets'),
        ),
        body: Center(
          child: Column(
            children: [
              const SizedBox(height: 20,),
              ElevatedButton(
                child: const Text("Abrir Bottom Modal Sheet"),
                onPressed: () { _showModalBottomSheet(context); },
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                child: const Text("Abrir Persistent Bottom Sheet"),
                onPressed: () { _showPersistentBottomSheet(context); },
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                child: const Text("Probar boton"),
                onPressed: () { print("Funciona boton"); },
              )
            ],
          ),
        )
    );
  }

  void _showModalBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 400.0,
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  const Text("Titulo del Bottom Sheet", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                  const SizedBox(height: 20,),
                  const Image(image: AssetImage("images/logo_flutter.png"), width: 150.0,),
                  const SizedBox(height: 20,),
                  ElevatedButton(
                      onPressed: () { Navigator.of(context).pop(); },
                      child: const Text("Cerrar bottom Sheet")
                  )
                ],
              ),
            ),
          );
        }
    );
  }

  void _showPersistentBottomSheet(context) {
    _key.currentState?.showBottomSheet((context) {
      return Container(
        height: 400.0,
        color: Colors.amberAccent,
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text("Titulo del Bottom Sheet", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              const Image(image: AssetImage("images/logo_flutter.png"), width: 150.0,),
              const SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: () { Navigator.of(context).pop(); },
                  child: const Text("Cerrar bottom Sheet")
              )
            ],
          ),
        ),
      );
    });
  }

}














