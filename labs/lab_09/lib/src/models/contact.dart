class Contact {
  String? id;
  String userId;
  String nombre;
  String telefono;
  String correo;

  Contact({required this.userId, required this.nombre, required this.telefono, required this.correo});

  Contact.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        userId = json['userId'] as String,
        nombre = json['nombre'] as String,
        telefono = json['telefono'] as String,
        correo = json['correo'] as String;

  Map<String, Object> toMap() {
    return {
      'userId': userId,
      'nombre': nombre,
      'telefono': telefono,
      'correo': correo,
    };
  }

}