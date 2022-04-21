import 'package:flutter/material.dart';

class RoomsPage extends StatefulWidget {
  const RoomsPage({Key? key}) : super(key: key);

  @override
  State<RoomsPage> createState() => _RoomsPageState();
}

class ItemHabitacion {
  bool isExpanded;
  final Widget header;
  final String title;
  final String body;

  ItemHabitacion(
      this.isExpanded,
      this.header,
      this.title,
      this.body,
      );
}

class _RoomsPageState extends State<RoomsPage> {

  List<ItemHabitacion> listaHabitaciones = [
    ItemHabitacion(false,
        Container(
          child: const Image(height: 60, image: AssetImage('images/1bed.jpg'),),
        ),
        "Habitación grande",
        "Habitación con una cama tamaño King"
    ),
    ItemHabitacion(false,
        Container(
          child: const Image(height: 60, image: AssetImage('images/2beds.jpg'),),
        ),
        "Habitación doble",
        "Habitación con dos camas, diseñada para dos personas."),
    ItemHabitacion(false,
        Container(
          child: const Image(height: 60, image: AssetImage('images/3beds.jpg'),),
        ),
        "Habitación Familiar",
        "Habitación extra grande diseñada para 3 o 4 personas."),
  ];

  ListView? listViewHabitaciones;

  @override
  Widget build(BuildContext context) {
    listViewHabitaciones = ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(10.0),
          child: ExpansionPanelList(
            children: listaHabitaciones.map((ItemHabitacion item) {
              return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return Container(
                    padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: ListTile(
                        leading: item.header,
                        title: Text(
                          item.title,
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.orangeAccent,
                          ),
                        )
                    ),
                  );
                },
                isExpanded: item.isExpanded,
                body: Container(
                  padding: EdgeInsets.only(bottom: 15.0, left: 15.0, right: 15.0),
                  alignment: Alignment.center,
                  child: Text(
                    item.body,
                  ),
                ),
              );
            }).toList(),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                listaHabitaciones[index].isExpanded = !listaHabitaciones[index].isExpanded;
              });
            },
          ),
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("Lista de habitaciones",),
      ),
      body: listViewHabitaciones,
      persistentFooterButtons: [
        ButtonBar(children: [
          ElevatedButton(
            child: const Text(
              'Siguiente',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold),
            ),
            style: ElevatedButton.styleFrom(
                primary: Colors.orangeAccent
            ),
            onPressed: () {
              nosVemos(context);
            },
          ),
        ]
        ),
      ],
    );
  }

  void nosVemos(BuildContext context) {
    var alertDialog = AlertDialog(
        title: const Text(
          "Nos vemos en la siguiente lección",
          style: TextStyle(color: Colors.orange),
        ),
        content: const Text("Gracias por completar el Laboratorio 8"),
        actions: [
          TextButton(
            child: const Text('No'),
            onPressed: () { Navigator.pop(context); },
            style: TextButton.styleFrom(
                primary: Colors.redAccent
            ),
          ),
          TextButton(
            child: const Text('Yes'),
            onPressed: () { Navigator.pop(context);},
            style: TextButton.styleFrom(
                primary: Colors.green
            ),
          ),
        ]);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }
}
