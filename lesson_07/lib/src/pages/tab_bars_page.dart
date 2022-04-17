import 'package:flutter/material.dart';

class TabBarsPage extends StatelessWidget {
  const TabBarsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tab Bars"),
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: const [
            ColoredBox(
              color: Colors.blue,
              child: TabBar(
                labelColor: Colors.white,
                indicatorColor: Colors.deepOrangeAccent,
                unselectedLabelColor: Colors.black38,
                tabs: [
                  Tab(text: "Listas",),
                  Tab(text: "Historial",),
                ],
              ),
            ),
            Expanded(
                child: TabBarView(
                  children: [
                    Tab1(),
                    Tab2()
                  ],
                )
            )
          ],
        ),
      ),
    );
  }
}

class Tab1 extends StatelessWidget {
  const Tab1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: const [
          ListTile(
            title: Text("Lista de elementos"),
          ),ListTile(
            title: Text("Lista de elementos"),
          ),ListTile(
            title: Text("Lista de elementos"),
          ),ListTile(
            title: Text("Lista de elementos"),
          ),ListTile(
            title: Text("Lista de elementos"),
          ),ListTile(
            title: Text("Lista de elementos"),
          ),ListTile(
            title: Text("Lista de elementos"),
          ),ListTile(
            title: Text("Lista de elementos"),
          ),ListTile(
            title: Text("Lista de elementos"),
          ),ListTile(
            title: Text("Lista de elementos"),
          ),ListTile(
            title: Text("Lista de elementos"),
          ),ListTile(
            title: Text("Lista de elementos"),
          ),
        ],
      ),
    );
  }
}

class Tab2 extends StatelessWidget {
  const Tab2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView(
        children: const [
          ListTile(
            title: Text("Historial de propiedades"),
            subtitle: Text("Detalle del historial de propiedades y procesos"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            title: Text("Historial de propiedades"),
            subtitle: Text("Detalle del historial de propiedades y procesos"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            title: Text("Historial de propiedades"),
            subtitle: Text("Detalle del historial de propiedades y procesos"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            title: Text("Historial de propiedades"),
            subtitle: Text("Detalle del historial de propiedades y procesos"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            title: Text("Historial de propiedades"),
            subtitle: Text("Detalle del historial de propiedades y procesos"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            title: Text("Historial de propiedades"),
            subtitle: Text("Detalle del historial de propiedades y procesos"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            title: Text("Historial de propiedades"),
            subtitle: Text("Detalle del historial de propiedades y procesos"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            title: Text("Historial de propiedades"),
            subtitle: Text("Detalle del historial de propiedades y procesos"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            title: Text("Historial de propiedades"),
            subtitle: Text("Detalle del historial de propiedades y procesos"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),
          ListTile(
            title: Text("Historial de propiedades"),
            subtitle: Text("Detalle del historial de propiedades y procesos"),
            trailing: Icon(Icons.arrow_forward_ios_outlined),
          ),

        ],
      ),
    );
  }
}

