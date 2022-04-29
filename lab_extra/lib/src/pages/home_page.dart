import 'package:flutter/material.dart';
import 'package:lab_extra/src/widgets/card_swipper_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("FlutterPelis"),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            _swiperCards()
          ],
        ),
      ),
    );
  }

  Widget _swiperCards() {
    return CardSwiper(peliculas: [1, 2, 3, 4],);
  }

}
