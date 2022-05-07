var name = 'Microsoft';
main() {
  companyName(name);
}
companyName(name) {
  for(int i= 1; i < 10; i++) {
    print(i);
  }
  name = "Google";
  print("El nombre de mi compañia es $name");
}