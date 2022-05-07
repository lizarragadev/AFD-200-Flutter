abstract class Student {
  contactInfo();
}

class ITStudent extends Student {
  @override
  contactInfo() {
    print("Dart fundamentals!");
  }
}

main() {
  final st = ITStudent();
  st.contactInfo();
}