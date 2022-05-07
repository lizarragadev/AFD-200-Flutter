import 'package:flutter/material.dart';
import 'package:lab_10/src/routes/routes.dart';

class ErrorPage extends StatelessWidget {
  const ErrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Colors.redAccent,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.warning_amber_rounded, size: 200, color: Colors.white,),
            const SizedBox(height: 20,),
            const Text("Error en la página", style: TextStyle(color: Colors.white, fontSize: 20.0),),
            const SizedBox(height: 60,),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, RoutePaths.errorPage);
                },
                child: const Text("Intentar de nuevo")
            )
          ],
        ),
      ),
    );
  }
}