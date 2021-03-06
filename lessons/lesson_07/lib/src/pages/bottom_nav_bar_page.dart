import 'package:flutter/material.dart';

class BottomNavBarPage extends StatefulWidget {
  const BottomNavBarPage({Key? key}) : super(key: key);

  @override
  State<BottomNavBarPage> createState() => _BottomNavBarPageState();
}

class _BottomNavBarPageState extends State<BottomNavBarPage> {
  int selectedPage = 0;
  final pages = [
    const Page1(),
    const Page2(),
    const Page3(),
    const Page4(),
  ];

  PreferredSizeWidget _appBarCustom = AppBar(
      title: const Text("Inicio"),
      backgroundColor: Colors.amberAccent,
  );

  modifyAppBar(color, titulo) {
    setState(() {
      _appBarCustom = AppBar(
        title: Text(titulo),
        backgroundColor: color,
      );
    });
  }

  void seleccionTab(int position) {
    switch(position) {
      case 0: modifyAppBar(Colors.amberAccent, "Inicio");
      break;
      case 1: modifyAppBar(Colors.deepOrangeAccent, "Favoritos");
      break;
      case 2: modifyAppBar(Colors.green, "Imagenes");
      break;
      case 3: modifyAppBar(Colors.black, "Perfil");
      break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBarCustom,
      body: pages[selectedPage],
      bottomNavigationBar: Container(
        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0)
            ),
          boxShadow: [
            BoxShadow(color: Colors.black38, blurRadius: 10, spreadRadius: 5)
          ]
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0)
          ),
          child: BottomNavigationBar(
            //Solo fondo blanco
            // type: BottomNavigationBarType.fixed,

            // Vista Normal
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.blue,
            fixedColor: Colors.white,
            unselectedItemColor: Colors.black26,

            // Eliminar label
            //showSelectedLabels: false,
            //showUnselectedLabels: false,

            // Fondo de color e iconos de colores
            // type: BottomNavigationBarType.fixed,
            // backgroundColor: Colors.blue,
            // selectedItemColor: Colors.deepOrange,
            // unselectedItemColor: Colors.greenAccent,

            // Fondo blanco con shifting
            // type: BottomNavigationBarType.fixed,
            // selectedItemColor: Colors.deepOrangeAccent,
            // unselectedItemColor: Colors.lightGreen,

            currentIndex: selectedPage,
            onTap: (position) {
              setState(() {
                selectedPage = position;
                seleccionTab(position);
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Inicio"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.star),
                  label: "Favoritos"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.image),
                  label: "Imagenes"
              ),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: "Perfil"
              ),
            ],
          ),
        ),
      ),
    );
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


