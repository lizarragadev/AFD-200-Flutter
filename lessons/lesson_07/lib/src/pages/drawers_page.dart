import 'package:flutter/material.dart';

class DrawersPage extends StatefulWidget {
  const DrawersPage({Key? key}) : super(key: key);

  @override
  State<DrawersPage> createState() => _DrawersPageState();
}

class DrawerItem {
  String title;
  IconData icon;
  DrawerItem(this.title, this.icon);
}

class _DrawersPageState extends State<DrawersPage> {
  int _selectedPage = 0;
  final _drawerItems = [
    DrawerItem("Inicio", Icons.home),
    DrawerItem("Favoritos", Icons.star),
    DrawerItem("Imagenes", Icons.image),
    DrawerItem("Perfil", Icons.person),
  ];

  @override
  Widget build(BuildContext context) {
    List<Widget> drawerOpts = [];
    for(var i = 0; i < _drawerItems.length; i++) {
      drawerOpts.add(
        ListTile(
          title: Text(_drawerItems[i].title),
          leading: Icon(_drawerItems[i].icon),
          onTap: () => _onSelectedItem(i),
          selected: i == _selectedPage,
        )
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(_drawerItems[_selectedPage].title),
      ),
      //endDrawer: Drawer(),
      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: const Text("Gustavo Lizárraga"),
              accountEmail: const Text("lizarraga.dev@gmail.com"),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.white,
                  child: CircleAvatar(
                    radius: 34,
                    backgroundImage: const Image(
                        image: AssetImage("images/profile.png")
                    ).image,
                  ),
                ),
                onTap: () { print("Hizo click en la foto de perfil principal"); },
              ),
              otherAccountsPictures: [
                CircleAvatar(
                  backgroundImage: const Image(image: AssetImage("images/profile.png"),).image,
                ),
              ],
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.greenAccent, Colors.green, Colors.green.shade900
                  ]
                )
              ),
            ),
            Column(
              children: drawerOpts,
            )
          ],
        ),
      ),
      body: _getDrawerItemWidget(_selectedPage),
    );
  }

  Widget _getDrawerItemWidget(int pos) {
    switch(pos) {
      case 0: return const Page1();
      case 1: return const Page2();
      case 2: return const Page3();
      case 3: return const Page4();
      default: return const Text("Error en seleccion");
    }
  }

  void _onSelectedItem(int index) {
    setState(() {
      _selectedPage = index;
      Navigator.of(context).pop();
    });
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.home, size: 150.0, color: Colors.amber,),
          SizedBox(height: 20,),
          Text("Inicio",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.star, size: 150.0, color: Colors.deepOrangeAccent,),
          SizedBox(height: 20,),
          Text("Favoritos",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.image, size: 150.0, color: Colors.green,),
          SizedBox(height: 20,),
          Text("Imagenes",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.person, size: 150.0, color: Colors.black,),
          SizedBox(height: 20,),
          Text("Perfil",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}

