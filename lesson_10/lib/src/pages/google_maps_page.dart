import 'dart:async';

import 'package:flutter/material.dart';

class GoogleMapsPage extends StatefulWidget {
  const GoogleMapsPage({Key? key}) : super(key: key);

  @override
  State<GoogleMapsPage> createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Maps'),
      ),
      body: Stack(
        children: [


          Container(
            margin: const EdgeInsets.only(top: 80, right: 10),
            alignment: Alignment.topRight,
            child: Column(
                children: [
                  FloatingActionButton(
                      child: const Icon(Icons.layers),
                      elevation: 5,
                      backgroundColor: Colors.blue,
                      onPressed: () {

                      }),
                  const SizedBox(height: 10,),
                  FloatingActionButton(
                      child: Icon(Icons.arrow_forward),
                      elevation: 5,
                      backgroundColor: Colors.blue,
                      onPressed: () {

                      }),
                  const SizedBox(height: 10,),
                  FloatingActionButton(
                      child: Icon(Icons.arrow_back),
                      elevation: 5,
                      backgroundColor: Colors.blue,
                      onPressed: () {

                      }),
                  const SizedBox(height: 10,),
                  FloatingActionButton(
                      child: const Icon(Icons.gps_fixed),
                      elevation: 5,
                      backgroundColor: Colors.blue,
                      onPressed: () {

                      }),
                ]
            ),
          ),

        ],
      ),
    );
  }

}

