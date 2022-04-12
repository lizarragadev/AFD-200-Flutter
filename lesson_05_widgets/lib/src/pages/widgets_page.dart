
import 'package:flutter/material.dart';

class WidgetsPage extends StatelessWidget {
  const WidgetsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Widgets"),
        backgroundColor: Colors.cyan[600],
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return SafeArea(
      child: SizedBox.expand(
        child: Container(
          color: Colors.amberAccent,
          margin: EdgeInsets.all(5.0),
          padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Flutter", style: TextStyle(fontSize: 30, color: Colors.green, fontFamily: "Beau"),),
              SizedBox(height: 10.0,),
              Text("Segundo Texto", style: TextStyle(fontSize: 30, color: Colors.green, fontFamily: "Rubik"),),
              SizedBox(height: 20.0,),
              Image(image: NetworkImage("https://androidatc.com/template/style/img/Android-ATC-Logo.jpg"), height: 80.0,),
              SizedBox(height: 20.0,),
              Image(image: AssetImage("images/img.png"), width: 150.0,),
              SizedBox(height: 20.0,),
              Icon(Icons.star, size: 60.0, color: Colors.deepOrange,),
              SizedBox(height: 20.0,),
              Card(
                elevation: 7.0,
                color: Colors.green[800],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
                ),
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Row(
                    children: [
                      Image(image: AssetImage("images/img.png"), width: 120,),
                      SizedBox(width: 15.0,),
                      Text("Curso Flutter", style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold, color: Colors.white),)
                    ],
                  ),
                ),
              )
            ],
          ),
          //decoration: BoxDecoration(
           // color: Colors.blue,
          //  shape: BoxShape.circle
          //),
          //transform: Matrix4.rotationZ(0.1),
        ),
      ),
    );
  }
}
