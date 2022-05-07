import 'package:flutter/material.dart';
import 'package:lab_extra/src/models/pelicula_model.dart';
import 'package:lab_extra/src/routes/routes.dart';

class MovieHorizontal extends StatelessWidget {

  final List<Pelicula> peliculas;
  final Function siguientePagina;

  const MovieHorizontal({ required this.peliculas, required this.siguientePagina });

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    final _pageController = PageController(
        initialPage: 1,
        viewportFraction: 0.3
    );

    _pageController.addListener(() {
      if(_pageController.position.pixels >= _pageController.position.maxScrollExtent - 200) {
        siguientePagina();
      }
    });

    return SizedBox(
      height: _screenSize.height * 0.2,
      child: PageView.builder(
        pageSnapping: false,
        controller: _pageController,
        itemCount: peliculas.length,
        itemBuilder: (context, i) {
          return _tarjeta(peliculas[i], context);
        },
      ),
    );
  }

  Widget _tarjeta(Pelicula pelicula, BuildContext context) {
    pelicula.uniqueId = '${ pelicula.id }-poster';
    final tarjeta = Container(
      margin: const EdgeInsets.only(right: 15.0),
      child: Column(
        children: [
          Hero(
            tag: pelicula.uniqueId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage( pelicula.getPosterImg() ),
                placeholder: const AssetImage('images/no-image.jpg'),
                fit: BoxFit.cover,
                height: 120.0,
              ),
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            pelicula.title!,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.caption,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );

    return GestureDetector(
      child: tarjeta,
      onTap: (){
        Navigator.pushNamed(context, RoutePaths.detailPage, arguments: pelicula );
      },
    );

  }

}
