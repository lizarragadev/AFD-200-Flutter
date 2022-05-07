main() {
  final toyota = new Car();
  toyota.type = "Camioneta";
  toyota.color = "Azul";
  toyota.maxSpeed = 100;
  toyota.numOfSeats = 6;

  print("El color es: ${toyota.color}");
  print("El tipo es: ${toyota.type}");
}

class Car {
  String? type;
  String color = "Rojo";
  int? maxSpeed;
  int numOfSeats = 4;
}