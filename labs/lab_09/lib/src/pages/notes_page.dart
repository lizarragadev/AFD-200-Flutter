
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:lab_09/src/models/note.dart';
import 'package:lab_09/src/providers/auth_provider.dart';
import 'package:lab_09/src/routes/routes.dart';
import 'package:lab_09/src/utils/constantes.dart';
import 'package:lab_09/src/utils/utils.dart';

class NotesPage extends StatefulWidget {
  const NotesPage({Key? key}) : super(key: key);

  @override
  State<NotesPage> createState() => _NotesPageState();
}

class _NotesPageState extends State<NotesPage> {

  final fireDatabase = FirebaseDatabase.instance;
  late Query _query;
  late AuthProvider _authProvider;

  @override
  Widget build(BuildContext context) {
    _authProvider = AuthProvider(context: context);
    User? _user = _authProvider.getUser();
    _query = fireDatabase.ref()
        .child(Constantes.NOTAS)
        .orderByChild(Constantes.N_USER_ID)
        .equalTo(_user!.uid);

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromRGBO(34, 179, 164, 1.0),
        onPressed: () {
          Navigator.pushNamed(context, RoutePaths.addNotePage);
        },
        child: const Icon(Icons.add,),
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: FirebaseAnimatedList(
          defaultChild: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                CircularProgressIndicator(),
                SizedBox(height: 20),
                Text("Cargando...")
              ],
            ),
          ),
          query: _query,
          itemBuilder: (context, snapshot, animation, index) {
            var note = convertDataToObject(snapshot);
            return Card(
              color: const Color.fromRGBO(168, 149, 219, 1.0),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: ListTile(
                  onTap: () {},
                  title: Text(note.titulo, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  subtitle: Text(note.contenido, style: const TextStyle(fontSize: 15, fontStyle: FontStyle.italic)),
                  trailing: IconButton(
                    icon: const Icon(Icons.delete, color: Colors.redAccent,),
                    onPressed: () {
                      deleteNote(note);
                    },
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Note convertDataToObject(DataSnapshot snapshot) {
    var dataObtenido = snapshot.value as Map<dynamic, dynamic>;
    dataObtenido.addAll({ 'id': snapshot.key });
    return Note.fromJson(dataObtenido);
  }

  void deleteNote(Note note) async {
    showBarraProgreso(context, "Eliminando mensaje...");
    await fireDatabase.ref().child(Constantes.NOTAS).child(note.id!).remove();
    Navigator.pop(context);
    mostrarMensaje(context, "Nota eliminada", Constantes.MENSAJE_EXITOSO);
  }
}
