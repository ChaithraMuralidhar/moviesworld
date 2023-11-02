
import 'package:flutterkit/networking/model/Movie.dart';

class MoviesList {
   List<Movie>  items;

  MoviesList({
    required this.items,
  });

  factory MoviesList.fromJson(Map<String,dynamic> json) {
    List movieData = json['items'];
    var item;
    List<Movie> moviesList = [];
    for (item in movieData) {
      Movie movieItem = Movie.fromJson(item);
      moviesList.add(movieItem);
    }
    return MoviesList(
      items: moviesList,
    );
  }
}