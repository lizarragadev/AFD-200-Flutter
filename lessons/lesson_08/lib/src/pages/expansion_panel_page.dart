import 'package:flutter/material.dart';

class ExpansionPanelPage extends StatefulWidget {
  const ExpansionPanelPage({Key? key}) : super(key: key);

  @override
  State<ExpansionPanelPage> createState() => _ExpansionPanelPageState();
}

class Item {
  bool isExpanded;
  String title;
  String description;
  Item({required this.title, required this.description, this.isExpanded = false});
}

class _ExpansionPanelPageState extends State<ExpansionPanelPage> {
  final List<Item> _data = List<Item>.generate(10, (index) {
    return Item(
        title: "Elemento número ${index + 1}",
        description: "Esta es una descripcion que irá en la parte expandida de nuestro item en una lista."
    );
  });

  var snackBar = (mensaje) {
    return SnackBar(
        content: Row(
          children: [
            const Icon(Icons.warning_amber_rounded, color: Colors.white,),
            const SizedBox(width: 10.0,),
            Text(mensaje)
          ],
        ),
      backgroundColor: Colors.redAccent,
      action: SnackBarAction(
        label: "Aceptar",
        textColor: Colors.amberAccent,
        onPressed: () {
          print("Hizo click en action de Snackbar");
        },
      ),
      duration: const Duration(seconds: 10),
    );
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Expacion Panel & Snackbar'),
        ),
        body: _crearListaExpandible()
    );
  }

  Widget _crearListaExpandible() {
    return ListView(
      children: [
        ExpansionPanelList(
          children: _data.map((item) {
            return ExpansionPanel(
                headerBuilder: (context, isExpanded) {
                  return ListTile(
                    title: Text(item.title),
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(snackBar("Error: ${item.title}"));
                    },
                  );
                },
                body: Column(
                  children: [
                    ListTile(
                      title: Text(item.description),
                      subtitle: const Text("Para eliminar este elemento presione le boton de borrar"),
                      trailing: const Icon(Icons.delete),
                      onTap: () {
                        setState(() {
                          _data.removeWhere((element) => item == element);
                        });
                      },
                    ),
                    const SizedBox(height: 10,)
                  ],
                ),
                isExpanded: item.isExpanded
            );
          }).toList(),
          expansionCallback: (index, isExpanded) {
            setState(() {
              _data[index].isExpanded = !isExpanded;
            });
          },
        )
      ],
    );
  }
}

