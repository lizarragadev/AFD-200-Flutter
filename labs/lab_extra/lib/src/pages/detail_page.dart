import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
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
                    const SizedBox( height: 10.0 ),
                    _posterTitulo( context, pelicula ),
                    _createDetails(pelicula),
                    _descripcion( pelicula ),
                    Container(
                      margin: const EdgeInsets.only(left: 20.0, bottom: 15),
                      child: const Text("Reparto", textAlign: TextAlign.start, style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold, color: Colors.redAccent),),
                    ),
                    _crearCasting( pelicula ),
                    const SizedBox(height: 20,)
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
      expandedHeight: 350.0,
      floating: false,
      pinned: true,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(right: 10, left: 10),
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
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
      child: Row(
        children: [
          Hero(
            tag: pelicula.uniqueId!,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image(
                image: NetworkImage( pelicula.getPosterImg() ),
                height: 170.0,
              ),
            ),
          ),
          const SizedBox(width: 20.0),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(pelicula.title!, overflow: TextOverflow.ellipsis, maxLines: 4, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                const SizedBox(height: 8,),
                const Text("Título original", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.red),),
                Text(pelicula.originalTitle!, overflow: TextOverflow.ellipsis, maxLines: 3, style: const TextStyle(fontSize: 15.0),),
                const SizedBox(height: 10,),
                Row(
                  children: [
                    const Icon(Icons.date_range, color: Colors.red,),
                    const SizedBox(width: 5,),
                    Text(pelicula.releaseDate!)
                  ],
                ),
                const SizedBox(height: 5,),
                Row(
                  children: [
                    const Icon(Icons.people, color: Colors.red,),
                    const SizedBox(width: 5,),
                    Text(pelicula.popularity.toString())
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _createDetails(Pelicula pelicula) {
    return Container(
      margin: const EdgeInsets.only(right: 20.0, left: 20.0),
      child: Column(
        children: [
          RatingBarIndicator(
            rating: pelicula.voteAverage!/2,
            direction: Axis.horizontal,
            itemCount: 5,
            itemPadding: const EdgeInsets.symmetric(horizontal: 3.0),
            itemBuilder: (context, _) => const Icon(
              Icons.star,
              color: Colors.amber,
            ),
          ),
          const SizedBox(height: 5,),
          Text("Valoración ${pelicula.voteAverage.toString()}  |  (${pelicula.voteCount}) revisiones.", style: const TextStyle(fontSize: 12),),
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
        style: const TextStyle(
          height: 1.5,
          letterSpacing: 1.0
        ),
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
      height: 220.0,
      child: PageView.builder(
        pageSnapping: false,
        controller: PageController(
            viewportFraction: 0.35,
            initialPage: 1
        ),
        itemCount: actores.length,
        itemBuilder: (context, i) =>_actorTarjeta( actores[i] ),
      ),
    );
  }

  Widget _actorTarjeta( Actor actor ) {
    return Column(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(20.0),
          child: FadeInImage(
            image: NetworkImage( actor.getFoto() ),
            placeholder: const AssetImage('images/no-image.jpg'),
            height: 150.0,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 8, right: 7.0, left: 7.0),
          child: Text(
            actor.name!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 3, right: 10.0, left: 10.0),
          child: Text(
            actor.character!,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 2,
            style: const TextStyle(fontSize: 10.0),
          ),
        )
      ],
    );
  }
}
