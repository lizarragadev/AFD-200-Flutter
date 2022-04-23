import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lesson_09/src/routes/routes.dart';
import 'package:lesson_09/src/utils/constantes.dart';
import 'package:lesson_09/src/utils/utils.dart';

class CloudFirestorePage extends StatefulWidget {
  const CloudFirestorePage({Key? key}) : super(key: key);

  @override
  State<CloudFirestorePage> createState() => _CloudFirestorePageState();
}

class _CloudFirestorePageState extends State<CloudFirestorePage> {

  final Stream<QuerySnapshot> _userStream = FirebaseFirestore.instance.collection(Constantes.NOTAS).snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color.fromRGBO(34, 179, 164, 1.0),
          onPressed: () {
            Navigator.pushNamed(context, RoutePaths.addNotePage);
          },
          child: Icon(Icons.add,),
        ),
        body: StreamBuilder(
          stream: _userStream,
          builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if(snapshot.hasError) {
              mostrarMensaje(context, "No se pudo obtener datos", Constantes.MENSAJE_ERROR);
              return Center(child: Text("Ocurrio un error"),);
            }
            if(snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator(),);
            }
            if(snapshot.connectionState == ConnectionState.done) {
              mostrarMensaje(context, "Se obtuvieron todos los datos", Constantes.MENSAJE_EXITOSO);
            }
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12)
              ),
              child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    var dataObtenido = snapshot.data!.docs[index].data().toString();
                    var dataFormateado = dataObtenido.replaceAll(RegExp("{|}|titulo:|contenido:"), "");
                    var listaData = dataFormateado.split(",");

                    return Card(
                      color: Color.fromRGBO(174, 226, 214, 1.0),
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: ListTile(
                          onTap: () {},
                          title: Text(listaData[1].trim(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          subtitle: Text(listaData[0].trim(), style: TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
                        ),
                      ),
                    );
                  }
              ),
            );
          },
        )
    );
  }
}









