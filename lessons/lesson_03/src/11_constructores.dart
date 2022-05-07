main() {
  final toyota = new Car(type: "Vagoneta", color: "Blanco", maxSpeed: 200, numOfSeats: 4);

  print(toyota);
}

class Car {
  String? type;
  String? color;
  int? maxSpeed;
  int? numOfSeats;
  Car({ this.type, this.color, this.maxSpeed, this.numOfSeats });

  String toString() => "El tipo es: $type\nEl color es: $color\nLa max velocidad es: $maxSpeed\nEl num de asientos es: $numOfSeats";

}