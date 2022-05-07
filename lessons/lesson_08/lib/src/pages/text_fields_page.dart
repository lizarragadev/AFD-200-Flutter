import 'dart:io';

import 'package:flutter/material.dart';

class TextFieldsPage extends StatefulWidget {
  const TextFieldsPage({Key? key}) : super(key: key);

  @override
  State<TextFieldsPage> createState() => _TextFieldsPageState();
}

class _TextFieldsPageState extends State<TextFieldsPage> {
  String valorTextField = "";
  TextEditingController controlador = TextEditingController();

  @override
  Widget build(BuildContext context) {
    if(Platform.isAndroid) {
      // Configuracion para Android
    }else {
      if(Platform.isIOS) {
        // Configuracion para iOS
      }else {
        // Otros.
      }
    }

    controlador.addListener(() {
      print(controlador.text);
    });

    return Scaffold(
        appBar: AppBar(
          title: const Text('TextFields'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("TextField Normal"),
                const TextField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15.0,),
                const Text("Tipo de teclado"),
                const TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15.0,),
                const Text("Tipo de acción"),
                const TextField(
                    textInputAction: TextInputAction.next,
                ),
                const SizedBox(height: 15.0,),
                const Text("Tamaño maximo y capitalizacion"),
                const TextField(
                  maxLength: 10,
                  textCapitalization: TextCapitalization.characters,
                ),
                const SizedBox(height: 15.0,),
                const Text("Tipo password"),
                const TextField(
                  obscureText: true,
                ),
                const SizedBox(height: 15.0,),
                const Text("Decoracion"),
                const TextField(
                  decoration: InputDecoration(
                    hintText: "Escriba su nombre aqui",
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.redAccent)
                    )
                  ),
                ),
                const SizedBox(height: 15.0,),
                const Text("Decoracion 2"),
                const TextField(
                  decoration: InputDecoration(
                      hintText: "Escriba su nombre aqui",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.redAccent)
                      )
                  ),
                ),
                const SizedBox(height: 15.0,),
                const Text("Decoracion 3"),
                const TextField(
                  decoration: InputDecoration(
                      hintText: "Escriba su nombre aqui",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.green)
                      ),
                    contentPadding: EdgeInsets.all(10)
                  ),
                ),
                const SizedBox(height: 15.0,),
                const Text("Detectar cambios con onChanged(valor)"),
                TextField(
                  decoration: const InputDecoration(
                      hintText: "Escriba su nombre aqui",
                      border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),),
                  ),
                  onChanged: (value) {
                    setState(() {
                      valorTextField = value;
                      print(valorTextField);
                    });
                  },
                ),
                const SizedBox(height: 15.0,),
                const Text("Detectar cambios con controller)"),
                TextField(
                  decoration: const InputDecoration(
                    hintText: "Escriba su apellido",
                    border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(20.0)),),
                  ),
                  controller: controlador,
                ),
              ],
            ),
          ),
        )
    );
  }
}















