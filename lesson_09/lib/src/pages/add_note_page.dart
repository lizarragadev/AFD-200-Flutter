
import 'package:flutter/material.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Nota'),
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: [
              const SizedBox(height: 10,),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Ingrese el título',
                  border: OutlineInputBorder(),
                ),
                onChanged: (nuevoValor) {

                },
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 10,),
              TextField(
                decoration: const InputDecoration(
                  hintText: 'Ingrese el contenido',
                  border: OutlineInputBorder(),
                ),
                onChanged: (nuevoValor) {

                },
                maxLines: 3,
                textCapitalization: TextCapitalization.sentences,
              ),
              const SizedBox(height: 20,),
              ElevatedButton(
                onPressed: () {

                },
                child: const Text("GUARDAR REALTIME",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {

                },
                child: const Text("GUARDAR FIRESTORE",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: Colors.green,
                  minimumSize: const Size.fromHeight(50), // NEW
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

}
