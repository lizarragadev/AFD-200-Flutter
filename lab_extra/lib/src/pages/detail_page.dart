import 'package:flutter/material.dart';
import 'package:lab_extra/src/models/actor_model.dart';
import 'package:lab_extra/src/models/pelicula_model.dart';
import 'package:lab_extra/src/providers/peliculas_provider.dart';

class DetailPage extends StatelessWidget {

  final Pelicula pelicula;
  const DetailPage(this.pelicula);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(
          slivers: [
            _crearAppbar( pelicula ),
            SliverList(
              delegate: SliverChildListDelegate(
                  [
                    SizedBox( height: 10.0 ),
                    _posterTitulo( context, pelicula ),
                    _descripcion( pelicula ),
                    _descripcion( pelicula ),
                    _descripcion( pelicula ),
                    _descripcion( pelicula ),
                    _crearCasting( pelicula )
                  ]
              ),
            )
          ],
        )
    );
  }

  Widget _crearAppbar( Pelicula pelicula ){
    return SliverAppBar(
      elevation: 2.0,
      backgroundColor: Colors.redAccent,
      expandedHeight: 300.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: EdgeInsets.only(right: 10, left: 10),
          child: Text(
            pelicula.title!,
            style: const TextStyle(color: Colors.white, fontSize: 16.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
          ),
        ),
        background: FadeInImage(
          image: NetworkImage( pelicula.getBackgroundImg() ),
          placeholder: const AssetImage('images/loading.gif'),
          fadeInDuration: const Duration(milliseconds: 150),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _posterTitulo(BuildContext context, Pelicula pelicula ){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        children: [
          Hero(
            tag: pelicula.uniqueId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage( pelicula.getPosterImg() ),
                height: 150.0,
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pelicula.title!, overflow: TextOverflow.ellipsis ),
                Text(pelicula.originalTitle!, overflow: TextOverflow.ellipsis ),
                SizedBox(height: 10,),
                Row(
                  children: [
                    const Icon( Icons.star_border ),
                    SizedBox(width: 5,),
                    Text( pelicula.voteAverage.toString() )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _descripcion( Pelicula pelicula ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Text(
        pelicula.overview!,
        textAlign: TextAlign.justify,
      ),
    );
  }

  Widget _crearCasting( Pelicula pelicula ) {
    final peliProvider = PeliculasProvider();
    return FutureBuilder(
      future: peliProvider.getCast(pelicula.id.toString()),
      builder: (context, AsyncSnapshot<List<Actor>> snapshot) {
        if( snapshot.hasData ) {
          return _crearActoresPageView( snapshot.data! );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _crearActoresPageView( List<Actor> actores ) {
    return SizedBox(
      height: 200.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
            viewportFraction: 0.3,
            initialPage: 1
        ),
        itemCount: actores.length,
        itemBuilder: (context, i) =>_actorTarjeta( actores[i] ),
      ),
    );
  }

  Widget _actorTarjeta( Actor actor ) {
    return Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: FadeInImage(
                image: NetworkImage( actor.getFoto() ),
                placeholder: AssetImage('images/no-image.jpg'),
                height: 150.0,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              actor.name!,
              overflow: TextOverflow.ellipsis,
            )
          ],
        )
    );
  }
}
