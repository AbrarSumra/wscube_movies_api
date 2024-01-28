class MovieModel {
  int id;
  String movie;
  num rating;
  String images;
  String imdb_url;

  MovieModel({
    required this.id,
    required this.movie,
    required this.rating,
    required this.imdb_url,
    required this.images,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
        id: json["id"],
        movie: json["movie"],
        rating: json["rating"],
        images: json["image"],
        imdb_url: json["imdb_url"]);
  }
}

class DataModel {
  List<MovieModel> movie;

  DataModel({
    required this.movie,
  });

  factory DataModel.fromJson(dynamic json) {
    List<MovieModel> listMovie = [];

    for (dynamic eachMap in json) {
      var eachProduct = MovieModel.fromJson(eachMap);
      listMovie.add(eachProduct);
    }

    return DataModel(
      movie: listMovie,
    );
  }
}
