import 'package:flutterkit/networking/ApiBaseHelper.dart';
import 'package:flutterkit/networking/model/MoviesList.dart';
import 'package:flutterkit/networking/model/Movie.dart';
import '../../db/database.dart';

class MoviesRepository {
  final String _apiKey = "";

  ApiBaseHelper _helper = ApiBaseHelper();

  Future<MoviesList> fetchMoviesList() async {
    final response = await _helper.get("");

    var movielistValue = MoviesList.fromJson(response);
    // for (Movie movie in movielistValue.items) {
    //   movie.imageBytes = await _helper.networkImageToBase64(movie.image);
    //   // print("imageBytes is $movie.imageBytes");
    // }
    return movielistValue;
  }

  // Future<List<Movie>> fetchMoviesListFromDB() async {
  //   DBProvider dbProvider = DBProvider();
  //   return dbProvider.getAllMovies();
  // }
}