class Student {
  String? name;
  String? address;
  int? telNumber;
  String? email;
}
class Teacher extends Student  {

}
main() {
  var trainer = Teacher();
  trainer.email = "corre@correo.com";
  trainer.telNumber = 343434;
  print(trainer.email);
  print(trainer.telNumber);
}