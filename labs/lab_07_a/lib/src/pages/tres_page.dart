import 'package:flutter/material.dart';

class TresPage extends StatelessWidget {
  const TresPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.business, size: 150.0, color: Colors.black,),
          SizedBox(height: 20,),
          Text("Negocios",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
          ),
        ],
      ),
    );
  }
}
