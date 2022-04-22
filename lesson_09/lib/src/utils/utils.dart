
import 'package:flutter/material.dart';

void mostrarMensaje(context, mensaje, tipo) {
  final MENSAJE_EXITOSO = 2;
  final snackBar = SnackBar(
    content: Text(mensaje),
    duration: Duration(seconds: 5),
    backgroundColor: (tipo == MENSAJE_EXITOSO) ? Colors.green : Colors.redAccent,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

void showBarraProgreso(context, mensaje) {
  AlertDialog alert = AlertDialog(
    content: Padding(
      padding: EdgeInsets.only(right: 10, left: 10),
      child: Row(
        children: [
          CircularProgressIndicator(),
          SizedBox(width: 25,),
          Text("$mensaje...")
        ],
      ),
    ),
  );
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return alert;
      }
  );
}












