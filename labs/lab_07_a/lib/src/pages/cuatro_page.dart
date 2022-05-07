import 'package:flutter/material.dart';

class CuatroPage extends StatelessWidget {
  const CuatroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.school, size: 150.0, color: Colors.black,),
          SizedBox(height: 20,),
          Text("Escuela",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
