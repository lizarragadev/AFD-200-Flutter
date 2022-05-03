import 'package:flutter/material.dart';
import 'package:lab_extra/src/models/pelicula_model.dart';
import 'package:lab_extra/src/providers/peliculas_provider.dart';
import 'package:lab_extra/src/routes/routes.dart';

class DataSearch extends SearchDelegate {

  String seleccion = '';
  final peliculasProvider = PeliculasProvider();

  final peliculas = [
    'Spiderman',
    'Aquaman',
    'Batman',
    'Shazam!',
    'Ironman',
    'Capitan America',
    'Superman',
    'Ironman 2',
    'Ironman 3',
    'Ironman 4',
    'Ironman 5',
  ];

  final peliculasRecientes = [
    'Spiderman',
    'Capitan America'
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon( Icons.clear ),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: (){
        close( context, null );
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Container(
        height: 100.0,
        width: 100.0,
        color: Colors.blueAccent,
        child: Text(seleccion),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if ( query.isEmpty ) {
      return Container();
    }
    return FutureBuilder(
      future: peliculasProvider.buscarPelicula(query),
      builder: (BuildContext context, AsyncSnapshot<List<Pelicula>> snapshot) {
        if( snapshot.hasData ) {
          final peliculas = snapshot.data;
          return ListView(
              children: peliculas!.map( (pelicula) {
                return ListTile(
                  leading: FadeInImage(
                    image: NetworkImage( pelicula.getPosterImg() ),
                    placeholder: const AssetImage('images/no-image.jpg'),
                    width: 50.0,
                    fit: BoxFit.contain,
                  ),
                  title: Text( pelicula.title! ),
                  subtitle: Text( pelicula.originalTitle! ),
                  onTap: (){
                    close( context, null);
                    pelicula.uniqueId = '';
                    Navigator.pushNamed(context, RoutePaths.detailPage, arguments: pelicula);
                  },
                );
              }).toList()
          );
        } else {
          return const Center(
              child: CircularProgressIndicator()
          );
        }
      },
    );
  }

}

