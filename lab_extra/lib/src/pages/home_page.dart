import 'package:flutter/material.dart';
import 'package:lab_extra/src/models/pelicula_model.dart';
import 'package:lab_extra/src/providers/peliculas_provider.dart';
import 'package:lab_extra/src/search/search_delegate.dart';
import 'package:lab_extra/src/widgets/card_swipper_widget.dart';
import 'package:lab_extra/src/widgets/movie_horizontal.dart';

class HomePage extends StatelessWidget {
  final peliculasProvider = PeliculasProvider();

  @override
  Widget build(BuildContext context) {

    peliculasProvider.getPopulares();

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Text("FlutterPelis"),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(
                context: context,
                delegate: DataSearch(),
              );
            },
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _swiperCards(),
            _footer()
          ],
        ),
      ),
    );
  }

  Widget _swiperCards() {
    return FutureBuilder(
        future: peliculasProvider.getEnCines(),
        builder: (context, AsyncSnapshot<List<Pelicula>> snapshot) {
          if( snapshot.hasData ) {
            return CardSwiper(
              peliculas: snapshot.data!,
            );
          } else {
            return Container(
              height: 400,
              child: Center(child: CircularProgressIndicator(),),
            );
          }
        },
    );
  }

  Widget _footer() {
    return Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10,),
          Container(
            padding: EdgeInsets.only(left: 20),
            child: const Text("Populares", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),),
          ),
          const SizedBox(height: 10.0,),
          StreamBuilder(
            stream: peliculasProvider.popularesStream,
            builder: (context, AsyncSnapshot<List<Pelicula>> snapshot) {
              if( snapshot.hasData ) {
                return MovieHorizontal(
                  peliculas: snapshot.data!,
                  siguientePagina: peliculasProvider.getPopulares,
                );
              } else {
                return const Center(child: CircularProgressIndicator(),);
              }
            },
          ),
        ],
      ),
    );
  }

}
