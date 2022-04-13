import 'package:flutter/material.dart';
import 'package:lesson_06_navigation/src/pages/dos_page.dart';

class UnoPage extends StatelessWidget {
  const UnoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pagina Uno"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return DosPage();
                  }));
                }, 
                child: Text("Ir a pagina 2")
            ),
            SizedBox(height: 30.0,),
            OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Volver")
            )
          ],
        )
      ),
    );
  }
}
