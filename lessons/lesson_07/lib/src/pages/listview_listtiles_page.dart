import 'package:flutter/material.dart';
import 'package:lesson_07/src/providers/people_provider.dart';

class ListViewListTilesPage extends StatefulWidget {
  const ListViewListTilesPage({Key? key}) : super(key: key);

  @override
  State<ListViewListTilesPage> createState() => _ListViewListTilesPageState();
}

class _ListViewListTilesPageState extends State<ListViewListTilesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Lista personas"),),
      body: _cargarElementos(context),
    );
  }

  Widget _cargarElementos(context) {
    return FutureBuilder(
        future: peopleProvider.cargarData(),
        initialData: const [],
        builder: ( context, AsyncSnapshot<List<dynamic>> snapshot ) {
          return Padding(
            padding: EdgeInsets.all(5),
            child: ListView(
              children: _listaItems(snapshot.data!, context),
            ),
          );
        }
    );
  }

  List<Widget> _listaItems(List<dynamic> data, BuildContext context) {
    final List<Widget> personas = [];
    for (var element in data) {
      personas.add(_crearItem(element['name'], element['country'],
          element['region'], element['image']));
    }
    return personas;
  }

  Widget _crearItem(name, country, region, image) {
    return Card(
      child: ListTile(
        title: Text(name),
        subtitle: Text("$country | $region"),
        leading: CircleAvatar(
          backgroundImage: Image(
            image: AssetImage(image),
          ).image,
        ),
        trailing: const Icon(Icons.arrow_right),
        onTap: () {
          print("Click en $name");
        },
      ),
      elevation: 4,
      color: Colors.lightBlueAccent.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
        side: const BorderSide(color: Colors.lightBlue, width: 1)
      ),
    );
  }
}





