import 'package:flutter/material.dart';

class BotonesPage extends StatefulWidget {
  const BotonesPage({Key? key}) : super(key: key);

  @override
  State<BotonesPage> createState() => _BotonesPageState();
}

class _BotonesPageState extends State<BotonesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Botones"),
        actions: [
          IconButton(
              tooltip: "Boton email",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Hizo click")));
              },
              icon: Icon(Icons.email)
          ),
          IconButton(
              tooltip: "Boton eliminar",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Hizo click")));
              },
              icon: Icon(Icons.delete)
          ),
          PopupMenuButton(itemBuilder: (BuildContext ctx) => [
            PopupMenuItem(child: Text("Opcion 1"), value: '1'),
            PopupMenuItem(child: Text("Opcion 2"), value: '2'),
            PopupMenuItem(child: Text("Opcion 3"), value: '3'),
          ],
          onSelected: (selectedValue) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Selecciono: $selectedValue")));
          },)
        ],
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: _hizoClick,
        child: Icon(Icons.star),
      ),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        children: [
          SizedBox(height: 20.0,),
          ElevatedButton(onPressed: _hizoClick, child: Text("Haz click aqui")),
          SizedBox(height: 15.0,),
          ElevatedButton(onPressed: null, child: Text("Click deshabilitado")),
          SizedBox(height: 15.0,),
          IconButton(onPressed: _hizoClick, icon: Icon(Icons.star)),
          SizedBox(height: 15.0,),
          TextButton(onPressed: _hizoClick, child: Text("Haga click aqui")),
          SizedBox(height: 15.0,),
          OutlinedButton(onPressed: _hizoClick, child: Text("Outline Button")),
          SizedBox(height: 15.0,),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: _hizoClick,
                child: Text("Boton 1"),
                style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(
                        width: 1.0,
                        color: Colors.deepOrange
                    )
                ),
              ),
              OutlinedButton(
                onPressed: _hizoClick,
                child: Text("Boton 2"),
                style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(
                        width: 3.0,
                        color: Colors.deepOrange
                    )
                ),
              ),
              OutlinedButton(
                onPressed: _hizoClick,
                child: Text("Boton 3"),
                style: OutlinedButton.styleFrom(
                    shape: StadiumBorder(),
                    side: BorderSide(
                        width: 5.0,
                        color: Colors.deepOrange
                    )
                ),
              ),
            ],
          ),
          _createDropDown()
        ],
      ),
    );
  }

  void _hizoClick() {
    print("Hizo click");
  }

  Widget _createDropDown() {
    List<String> items = ['Bolivia', 'Brazil', 'Chile', 'Colombia'];
    String valorSeleccionado = items[0];
    return DropdownButton(
        value: valorSeleccionado,
        items: items.map((String value) {
          return DropdownMenuItem(
            child: Row(
              children: [
                Icon(Icons.settings, size: 15,),
                SizedBox(width: 10.0,),
                Text(value)
              ],
            ),
            value: value,
          );
        }).toList(),
        onChanged: (String? nuevoValor) {
          setState(() {
            valorSeleccionado = nuevoValor!;
            print(" ++++++++++++++ $nuevoValor");
            print(" ++++++++++++++ $valorSeleccionado");
          });
        },
    );
  }
}


