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
      appBar: AppBar(title: Text("Botones"),),
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
          )
        ],
      ),
    );
  }

  void _hizoClick() {
    print("Hizo click");
  }
}
