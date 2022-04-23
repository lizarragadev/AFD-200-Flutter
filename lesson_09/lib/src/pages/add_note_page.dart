
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:lesson_09/src/utils/constantes.dart';
import 'package:lesson_09/src/utils/utils.dart';
import 'package:uuid/uuid.dart';

class AddNotePage extends StatefulWidget {
  const AddNotePage({Key? key}) : super(key: key);

  @override
  State<AddNotePage> createState() => _AddNotePageState();
}

class _AddNotePageState extends State<AddNotePage> {
  String titulo = "";
  String contenido = "";

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
                  validarForm(Constantes.TYPE_FIRESTORE);
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

  void validarForm(tipo) {
    if(titulo.isNotEmpty && contenido.isNotEmpty) {
      if(tipo == Constantes.TYPE_REALTIME) {
        guardarNotaRealtime();
      } else {
        guardarNotaFirestore();
      }
    } else {
      mostrarMensaje(context, "Existen campos vacíos", Constantes.MENSAJE_ERROR);
    }
  }

  Future<void> guardarNotaRealtime() async {
    try {
      final fireDatabase = FirebaseDatabase.instance;
      var refRealtime = fireDatabase.ref().child("${Constantes.NOTAS}/${generarUUID()}");
      await refRealtime.set({
        Constantes.N_TITULO: titulo,
        Constantes.N_CONTENIDO: contenido
      }).asStream();
      mostrarMensaje(context, "Se guardó la nota", Constantes.MENSAJE_EXITOSO);
      Navigator.pop(context);
    } catch(err) {
      mostrarMensaje(context, "Error: $err", Constantes.MENSAJE_ERROR);
      Navigator.pop(context);
    }
  }

  Future<void> guardarNotaFirestore() async {
    try {
      CollectionReference refFirestore = FirebaseFirestore.instance.collection(Constantes.NOTAS);
      await refFirestore.add({
        Constantes.N_TITULO: titulo,
        Constantes.N_CONTENIDO: contenido
      }).whenComplete(() {
        mostrarMensaje(context, "Se guardo correctamente", Constantes.MENSAJE_EXITOSO);
        Navigator.pop(context);
      });
    } on FirebaseException catch(err) {
      mostrarMensaje(context, "Error: ${err}", Constantes.MENSAJE_ERROR);
      Navigator.pop(context);
    }
  }

  dynamic generarUUID() {
    return Uuid().v4();
  }














}
