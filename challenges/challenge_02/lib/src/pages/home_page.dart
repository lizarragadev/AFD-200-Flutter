import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/unoPage");
                },
                child: Text("Ir a página 1")
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/dosPage");
                },
                child: Text("Ir a página 2")
            ),
          ],
        ),
      ),
    );
  }
}
