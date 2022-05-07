import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lab_09/src/models/contact.dart';
import 'package:lab_09/src/providers/auth_provider.dart';
import 'package:lab_09/src/utils/constantes.dart';
import 'package:lab_09/src/utils/utils.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({Key? key}) : super(key: key);

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  String nombre = "";
  String telefono = "";
  String correo = "";
  late AuthProvider _provider;

  @override
  Widget build(BuildContext context) {
    _provider = AuthProvider(context: context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Agregar Contacto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            const SizedBox(height: 10,),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Ingrese el nombre',
                border: OutlineInputBorder(),
              ),
              onChanged: (nuevoValor) {
                setState(() {
                  nombre = nuevoValor;
                });
              },
              textCapitalization: TextCapitalization.words,
            ),
            const SizedBox(height: 10,),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Ingrese el telefono',
                border: OutlineInputBorder(),
              ),
              onChanged: (nuevoValor) {
                setState(() {
                  telefono = nuevoValor;
                });
              },
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 10,),
            TextField(
              decoration: const InputDecoration(
                hintText: 'Ingrese el correo',
                border: OutlineInputBorder(),
              ),
              onChanged: (nuevoValor) {
                setState(() {
                  correo = nuevoValor;
                });
              },
              keyboardType: TextInputType.emailAddress,
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
    if(nombre.isNotEmpty && telefono.isNotEmpty && correo.isNotEmpty) {
      guardarContactFirestore();
    } else {
      mostrarMensaje(context, "Existen campos vacíos", Constantes.MENSAJE_ERROR);
    }
  }

  Future<void> guardarContactFirestore() async {
    try {
      showBarraProgreso(context, "Agregando contacto...");
      CollectionReference refFirestore = FirebaseFirestore.instance.collection(Constantes.CONTACTS);
      await refFirestore.add(createContact().toMap()).whenComplete(() {
        mostrarMensaje(context, "Se guardo correctamente", Constantes.MENSAJE_EXITOSO);
        Navigator.pop(context);
      });
      Navigator.pop(context);
    } on FirebaseException catch(err) {
      mostrarMensaje(context, "Error: ${err}", Constantes.MENSAJE_ERROR);
      Navigator.pop(context);
    }
  }

  Contact createContact() {
    final _user = _provider.getUser();
    return Contact(
        userId: _user!.uid,
        nombre: nombre,
        telefono: telefono,
        correo: correo
    );
  }
}
