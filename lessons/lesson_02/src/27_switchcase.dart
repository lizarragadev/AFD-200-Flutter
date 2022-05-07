main() {
  int day = 4;
  String today = "";
  switch(day) {
    case 1: today = "Domingo";
    break;
    case 2: today = "Lunes";
    break;
    case 3: today = "Martes";
    break;
    case 4: today = "Miercoles";
    break;
    case 5: today = "Jueves";
    break;
    case 6: today = "Viernes";
    break;
    case 7: today = "Sabado";
    break;
    default: today = "Dia no valido";
  }
  print("Hoy es $today");
}