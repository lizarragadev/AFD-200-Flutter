import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lab_09/src/models/Note.dart';
import 'package:lab_09/src/providers/auth_provider.dart';
import 'package:lab_09/src/utils/constantes.dart';
import 'package:lab_09/src/utils/utils.dart';
import 'package:uuid/uuid.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  String titulo = "";
  String contenido = "";
  late AuthProvider _authProvider;
  late User? _user;

  @override
  Widget build(BuildContext context) {
    _authProvider = AuthProvider(context: context);
    _user = _authProvider.getUser();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Nota'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const SizedBox(height: 10,),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Ingrese el título',
                border: OutlineInputBorder(),
              ),
              onChanged: (nuevoValor) {
                setState(() {
                  titulo = nuevoValor;
                });
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
                setState(() {
                  contenido = nuevoValor;
                });
              },
              maxLines: 3,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 20,),
            ElevatedButton(
              onPressed: () {
                validarForm(Constantes.TYPE_REALTIME);
              },
              child: const Text("GUARDAR",
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
          ],
        ),
      ),
    );
  }

  void validarForm(tipo) {
    if(titulo.isNotEmpty && contenido.isNotEmpty) {
      guardarNota();
    } else {
      mostrarMensaje(context, "Existen campos vacíos", Constantes.MENSAJE_ERROR);
    }
  }

  Future<void> guardarNota() async {
    try {
      showBarraProgreso(context, "Agregando nota...");
      final fireDatabase = FirebaseDatabase.instance;
      var refRealtime = fireDatabase.ref().child("${Constantes.NOTAS}/${generarUUID()}");
      await refRealtime.set(createNote().toMap());
      //.asStream() para no usar Futures.
      mostrarMensaje(context, "Se guardó la nota", Constantes.MENSAJE_EXITOSO);
      Navigator.pop(context);
      Navigator.pop(context);
    } catch(err) {
      mostrarMensaje(context, "Error: $err", Constantes.MENSAJE_ERROR);
      Navigator.pop(context);
    }
  }

  Note createNote() {
    return Note(
        userId: _user!.uid,
        titulo: titulo,
        contenido: contenido
    );
  }

  dynamic generarUUID() {
    return Uuid().v4();
  }














}
