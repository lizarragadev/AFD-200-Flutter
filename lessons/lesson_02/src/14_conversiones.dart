main() {
  double x = 45.4;
  int y = x.toInt();

  double c = 34.67;
  double res = x / c;

  print(res);

  print(res.round());
  print(res.ceil());
  print(res.floor());
  print(res.toStringAsFixed(1));
  print(res.toStringAsFixed(3));
  print(res.toStringAsFixed(5));
}