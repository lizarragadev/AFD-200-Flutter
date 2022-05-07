main() {
  int x = 1;
  do {
    print("x = $x");
    x++;
    if(x == 3)
      break;
  } while(x <= 5);
}