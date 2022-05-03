
class Peliculas {
  List<Pelicula> items = [];

  Peliculas();

  Peliculas.fromJsonList( List<dynamic> jsonList ) {
    if(jsonList == null) return;
    for(var item in jsonList) {
      final pelicula = Pelicula.fromJsonMap(item);
      items.add(pelicula);
    }
  }
}

class Pelicula {
  String? uniqueId;
  bool? adult;
  String? backdropPath;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Pelicula(
      {this.adult,
        this.backdropPath,
        this.id,
        this.originalLanguage,
        this.originalTitle,
        this.overview,
        this.popularity,
        this.posterPath,
        this.releaseDate,
        this.title,
        this.video,
        this.voteAverage,
        this.voteCount});

  Pelicula.fromJsonMap(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'] / 1;
    voteCount = json['vote_count'];
  }

  getPosterImg() {
    if( posterPath == null ) {
      return "https://app.sectorcnc.com/storage/users/muntada/1611230007_6DNEAoq21xBbFxI1.jpeg";
    } else {
      return "https://image.tmdb.org/t/p/w500/$posterPath";
    }
  }

  getBackgroundImg() {
    if ( backdropPath == null || backdropPath == "null") {
      return 'https://app.sectorcnc.com/storage/users/muntada/1611230007_6DNEAoq21xBbFxI1.jpeg';
    } else {
      return 'https://image.tmdb.org/t/p/w500/$backdropPath';
    }
  }
}