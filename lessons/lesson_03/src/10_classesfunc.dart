main() {
  final toyota = new Car();
  toyota.type = "Camioneta";
  toyota.color = "Azul";
  toyota.maxSpeed = 100;
  toyota.numOfSeats = 6;

  print(toyota);

  toyota.aumentarVelocidad(100);

  print(toyota);
}

class Car {
  String? type;
  String color = "Rojo";
  int? maxSpeed;
  int numOfSeats = 4;

  void aumentarVelocidad(int x) {
    maxSpeed = maxSpeed! + x;
  }

  String toString() => "El tipo es: $type\nEl color es: $color\nLa max velocidad es: $maxSpeed\nEl num de asientos es: $numOfSeats";
}