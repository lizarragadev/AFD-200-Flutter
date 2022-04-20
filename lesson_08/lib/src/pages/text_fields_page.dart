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
          title: Text('TextFields'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("TextField Normal"),
                TextField(
                  autofocus: true,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 15.0,),
                Text("Tipo de teclado"),
                TextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 15.0,),
                Text("Tipo de acción"),
                TextField(
                    textInputAction: TextInputAction.next,
                ),
                SizedBox(height: 15.0,),
                Text("Tamaño maximo y capitalizacion"),
                TextField(
                  maxLength: 10,
                  textCapitalization: TextCapitalization.characters,
                ),
                SizedBox(height: 15.0,),
                Text("Tipo password"),
                TextField(
                  obscureText: true,
                ),
                SizedBox(height: 15.0,),
                Text("Decoracion"),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Escriba su nombre aqui",
                    border: InputBorder.none,
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.redAccent)
                    )
                  ),
                ),
                SizedBox(height: 15.0,),
                SizedBox(height: 15.0,),
                Text("Decoracion 2"),
                TextField(
                  decoration: InputDecoration(
                      hintText: "Escriba su nombre aqui",
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0)),
                          borderSide: BorderSide(color: Colors.redAccent)
                      )
                  ),
                ),
                SizedBox(height: 15.0,),
                SizedBox(height: 15.0,),
                Text("Decoracion 3"),
                TextField(
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
                SizedBox(height: 15.0,),
                Text("Detectar cambios con onChanged(valor)"),
                TextField(
                  decoration: InputDecoration(
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
                SizedBox(height: 15.0,),
                Text("Detectar cambios con controller)"),
                TextField(
                  decoration: InputDecoration(
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















