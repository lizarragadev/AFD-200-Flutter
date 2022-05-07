main() {
  final toyota = new Car.defecto();
  final otro = new Car.dosArgs(200, 4);
  print(toyota);
  print(otro);
}

class Car {
  String? type;
  String? color;
  int? maxSpeed;
  int? numOfSeats;

  Car.defecto() {
    this.type = "Taxi";
    this.color = "Negro";
    this.maxSpeed = 100;
    this.numOfSeats = 6;
  }
  Car.dosArgs(ms, ns) {
    this.maxSpeed = ms;
    this.numOfSeats = ns;
    this.type = "No Corresponde";
    this.color = "No Corresponde";
  }

  String toString() => "El tipo es: $type\nEl color es: $color\nLa max velocidad es: $maxSpeed\nEl num de asientos es: $numOfSeats";

}