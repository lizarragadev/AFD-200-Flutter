main() {
  final toyota = new Car();
  toyota.setType = "Vagoneta";
  print(toyota.getType);
}

class Car {
  String? _type;
  String? _color;
  int? _maxSpeed;
  int? _numOfSeats;

  set setType(String valor) => this._type = valor;
  String? get getType => this._type;

  String toString() => "El tipo es: ${this._type}\nEl color es: ${this._color}\nLa max velocidad es: ${this._maxSpeed}\nEl num de asientos es: ${this._numOfSeats}";
}