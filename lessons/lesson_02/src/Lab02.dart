import 'dart:io';

main() {
  // Solicitar el tipo de Pizza (Grande g, Mediana m o pequeña p)
  // Solicitar la cantidad de pizzas que requiere el cliente.
  // Imprimir el costo total a pagar.
  print("===========================");
  print("********* PEDIDOS DE PIZZA ********");
  print("Precios:");
  print("Pequeña: Bs. 40, Mediana: Bs. 80, Grande: Bs. 100");
  print("Ingrese el tamaño de la Pizza que desea:");
  String size = stdin.readLineSync()!;
  print("¿Cuántas Pizzas desea?");
  int quantity = int.parse(stdin.readLineSync()!);
  var price = 0;
  var total = 0;
  switch(size) {
    case "p": {
      price = 40;
      total = price * quantity;
      break;
    }
    case "m": {
      price = 80;
      total = price * quantity;
      break;
    }
    case "g": {
      price = 100;
      total = price * quantity;
      break;
    }
    default: {
      print("Seleccion incorrecta");
    }
  }
  if(price != 0) {
    print("El precio total es: Bs. $total");
    print("===========================");
  }
}