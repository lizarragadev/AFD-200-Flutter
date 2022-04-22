import 'package:flutter/material.dart';

class CloudFirestorePage extends StatefulWidget {
  const CloudFirestorePage({Key? key}) : super(key: key);

  @override
  State<CloudFirestorePage> createState() => _CloudFirestorePageState();
}

class _CloudFirestorePageState extends State<CloudFirestorePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Color.fromRGBO(34, 179, 164, 1.0),
          onPressed: () {

          },
          child: Icon(Icons.add,),
        ),
        body: Text("Contenido")
    );
  }
}
