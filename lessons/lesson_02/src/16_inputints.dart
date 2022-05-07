import 'dart:io';

main() {
  print("Ingrese el primer numero");
  int num1 = int.parse(stdin.readLineSync()!);
  print("Ingrese el segundo numero");
  int num2 = int.parse(stdin.readLineSync()!);

  var sum = num1 + num2;
  print("El resultado de la suma es $sum");
}