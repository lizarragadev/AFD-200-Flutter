
import 'package:flutter/material.dart';

class RealtimeDatabasePage extends StatefulWidget {
  const RealtimeDatabasePage({Key? key}) : super(key: key);

  @override
  State<RealtimeDatabasePage> createState() => _RealtimeDatabasePageState();
}

class _RealtimeDatabasePageState extends State<RealtimeDatabasePage> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(34, 179, 164, 1.0),
        onPressed: () {

        },
        child: Icon(Icons.add,),
      ),
      body: Text("Contenido"),
    );
  }
}
