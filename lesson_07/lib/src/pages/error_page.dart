import 'package:flutter/material.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Error 404"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.warning_amber_outlined, size: 150.0, color: Colors.red,),
            SizedBox(height: 20,),
            Text("No se encontró la página.",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),
            SizedBox(height: 30,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Volver a intentar")
            )
          ],
        ),
      ),
    );
  }
}
