import 'package:flutter/material.dart';

class UnoPage extends StatelessWidget {
  const UnoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.home, size: 150.0, color: Colors.black,),
          SizedBox(height: 20,),
          Text("Inicio",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
