class Note {
  String? id;
  String userId;
  String titulo;
  String contenido;

  Note({required this.userId, required this.titulo, required this.contenido});

  Note.fromJson(Map<dynamic, dynamic> json)
      : id = json['id'] as String,
        userId = json['userId'] as String,
        titulo = json['titulo'] as String,
        contenido = json['contenido'] as String;

  Map<String, Object> toMap() {
    return {
      'userId': userId,
      'titulo': titulo,
      'contenido': contenido,
    };
  }

}