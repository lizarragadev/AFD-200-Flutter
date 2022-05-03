import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:lab_extra/src/models/pelicula_model.dart';
import 'package:lab_extra/src/routes/routes.dart';

class CardSwiper extends StatelessWidget {
  final List<Pelicula> peliculas;

  CardSwiper({ required this.peliculas });

  @override
  Widget build(BuildContext context) {
    final _screenSize = MediaQuery.of(context).size;

    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Swiper(
        itemHeight: _screenSize.height * 0.5,
        itemWidth: _screenSize.width * 0.7,
        itemCount: peliculas.length,
        layout: SwiperLayout.STACK,
        onTap: (index) {
          peliculas[index].uniqueId = '${ peliculas[index].id }-poster';
          Navigator.pushNamed(context, RoutePaths.detailPage, arguments: peliculas[index]);
        },
        itemBuilder: (BuildContext context,int index){
          return ClipRRect(
            borderRadius: BorderRadius.circular(20.0),
            child: FadeInImage(
              placeholder: AssetImage("images/no-image.jpg"),
              image: NetworkImage(peliculas[index].getPosterImg()), fit: BoxFit.cover,),
            );
        },
      ),
    );
  }
}
