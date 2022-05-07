import 'package:flutter/material.dart';

class BotonesPage extends StatefulWidget {
  const BotonesPage({Key? key}) : super(key: key);

  @override
  State<BotonesPage> createState() => _BotonesPageState();
}

class _BotonesPageState extends State<BotonesPage> {
  List<String> items = ['Bolivia', 'Brazil', 'Chile', 'Colombia'];
  String? valorSeleccionado = 'Bolivia';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Botones"),
        actions: [
          IconButton(
              tooltip: "Boton email",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Hizo click botom email")));
              },
              icon: const Icon(Icons.email)
          ),
          IconButton(
              tooltip: "Boton eliminar",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Hizo click boton eliminar")));
              },
              icon: const Icon(Icons.delete)
          ),
          PopupMenuButton(itemBuilder: (BuildContext ctx) => [
            const PopupMenuItem(child: Text("Opcion 1"), value: '1'),
            const PopupMenuItem(child: Text("Opcion 2"), value: '2'),
            const PopupMenuItem(child: Text("Opcion 3"), value: '3'),
          ],
          onSelected: (selectedValue) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Selecciono: $selectedValue")));
          },)
        ],
      ),
      body: _body(),
      floatingActionButton: FloatingActionButton(
        onPressed: _hizoClick,
        child: const Icon(Icons.star),
      ),
    );
  }

  Widget _body() {
    return Center(
      child: Column(
        children: [
          const SizedBox(height: 20.0,),
          ElevatedButton(onPressed: _hizoClick, child: const Text("Haz click aqui")),
          const SizedBox(height: 15.0,),
          const ElevatedButton(onPressed: null, child: Text("Click deshabilitado")),
          const SizedBox(height: 15.0,),
          IconButton(onPressed: _hizoClick, icon: const Icon(Icons.star)),
          const SizedBox(height: 15.0,),
          TextButton(onPressed: _hizoClick, child: const Text("Haga click aqui")),
          const SizedBox(height: 15.0,),
          OutlinedButton(onPressed: _hizoClick, child: const Text("Outline Button")),
          const SizedBox(height: 15.0,),
          ButtonBar(
            alignment: MainAxisAlignment.spaceEvenly,
            children: [
              OutlinedButton(
                onPressed: _hizoClick,
                child: const Text("Boton 1"),
                style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                        width: 1.0,
                        color: Colors.deepOrange
                    )
                ),
              ),
              OutlinedButton(
                onPressed: _hizoClick,
                child: const Text("Boton 2"),
                style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                        width: 3.0,
                        color: Colors.deepOrange
                    )
                ),
              ),
              OutlinedButton(
                onPressed: _hizoClick,
                child: const Text("Boton 3"),
                style: OutlinedButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(
                        width: 5.0,
                        color: Colors.deepOrange
                    )
                ),
              ),
            ],
          ),
          DropdownButton(
            value: valorSeleccionado,
            items: items.map((value) {
              return DropdownMenuItem(
                child: Row(
                  children: [
                    const Icon(Icons.settings, size: 15,),
                    const SizedBox(width: 10.0,),
                    Text(value)
                  ],
                ),
                value: value,
              );
            }).toList(),
            onChanged: (nuevoValor) {
              setState(() {
                valorSeleccionado = nuevoValor.toString();
              });
            },
          )
        ],
      ),
    );
  }

  void _hizoClick() {
    print("Hizo click en boton");
  }

}


