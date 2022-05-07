import 'package:flutter/material.dart';

class StacksPage extends StatelessWidget {
  const StacksPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/paisaje.jpeg"),
                fit: BoxFit.fitHeight
              )
            ),
          ),
          Positioned(
              bottom: 25.0,
              left: 15.0,
              right: 15.0,
              child: Card(
                elevation: 9,
                color: Colors.white.withOpacity(0.6),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: const [
                      Text("Bolivia", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                      SizedBox(height: 10,),
                      Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",
                        textAlign: TextAlign.justify,),
                    ],
                  ),
                ),
              ),
          ),
        ],
      ),
    );
  }
}
