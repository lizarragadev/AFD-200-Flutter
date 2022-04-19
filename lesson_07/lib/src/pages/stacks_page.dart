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
              bottom: 20.0,
              left: 10.0,
              right: 10.0,
              child: Card(
                elevation: 9,
                color: Colors.white.withOpacity(0.7),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 16.0, left: 16.0, top: 16.0),
                      child: Text("Bolivia", style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16.0, left: 16.0, bottom: 16.0, top: 10.0),
                      child: Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. ",),
                    ),
                  ],
                ),
              )
          )
        ],
      ),
    );
  }
}
