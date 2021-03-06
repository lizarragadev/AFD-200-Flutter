import 'package:flutter/material.dart';
import 'package:lesson_06_navigation/src/pages/tres_page.dart';

class DosPage extends StatelessWidget {
  const DosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pagina Dos"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return TresPage(valor: "Android Flutter",);
                    }));
                  },
                  child: const Text("Ir a pagina 3")
              ),
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
