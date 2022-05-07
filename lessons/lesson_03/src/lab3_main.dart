import 'lab3_objeto.dart' as emp;

main() {
  double extraPayPerHr;
  final empleado = new emp.Employee("Developer", "La Paz", 6000, 5);

  if(empleado.salary >= 5000)
    extraPayPerHr = 100;
  else
    extraPayPerHr = 200;

  double totalSalary = empleado.salary + (empleado.overTime * extraPayPerHr);
  print("El salario total es: Bs $totalSalary");
}