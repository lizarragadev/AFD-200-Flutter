import 'package:flutter/material.dart';

class MenuPage extends StatelessWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Menu"), centerTitle: true, backgroundColor: Colors.cyan,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '1');
                },
                child: const Text("Ir a página 1")
            ),
            const SizedBox(height: 30.0,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '2');
                },
                child: const Text("Ir a página 2")
            ),
            const SizedBox(height: 30.0,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '3');
                },
                child: const Text("Ir a página 3")
            ),
          ],
        ),
      ),
    );
  }
}
