import 'package:flutter/material.dart';

class DosPage extends StatelessWidget {
  const DosPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.alarm, size: 150.0, color: Colors.black,),
          SizedBox(height: 20,),
          Text("Alarmas",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
