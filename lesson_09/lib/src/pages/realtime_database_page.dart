
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:lesson_09/src/routes/routes.dart';
import 'package:lesson_09/src/utils/constantes.dart';

class RealtimeDatabasePage extends StatefulWidget {
  const RealtimeDatabasePage({Key? key}) : super(key: key);

  @override
  State<RealtimeDatabasePage> createState() => _RealtimeDatabasePageState();
}

class _RealtimeDatabasePageState extends State<RealtimeDatabasePage> {

  final fireDatabase = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    var referencia = fireDatabase.ref().child(Constantes.NOTAS);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(34, 179, 164, 1.0),
        onPressed: () {
          Navigator.pushNamed(context, RoutePaths.addNotePage);
        },
        child: Icon(Icons.add,),
      ),
      body: FirebaseAnimatedList(
        query: referencia,
        itemBuilder: (context, snapshot, animation, index) {
          var dataObtenido = snapshot.value.toString();
          var dataFormateado = dataObtenido.replaceAll(RegExp("{|}|titulo:|contenido:"), "");
          var listaData = dataFormateado.split(",");

          return Card(
            color: Color.fromRGBO(168, 149, 219, 1.0),
            child: Padding(
              padding: EdgeInsets.all(10),
              child: ListTile(
                onTap: () {},
                title: Text(listaData[1].trim(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                subtitle: Text(listaData[0].trim(), style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.redAccent,),
                  onPressed: () {
                    referencia.child(snapshot.key!).remove();
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}












