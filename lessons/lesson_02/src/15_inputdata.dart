import 'dart:io';

main() {
  print('=========================');
  print("Ingrese su nombre completo");
  String fullName = stdin.readLineSync()!;
  print("Hola $fullName");
  print('=========================');
  // String? cad = null;

}

/*
Por defecto en Dart no existen nulos (Mientras no se diga lo contrario)
? -> Permite asignar nulabilidad a una variable.
! -> Asegura que el resultado de una funcion no es nulo.
* */