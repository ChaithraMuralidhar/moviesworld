import 'dart:async';

import 'package:flutterkit/networking/ApiResponse.dart';
import 'package:flutterkit/networking/model/MoviesList.dart';
import 'package:flutterkit/networking/repository/MoviesRepository.dart';

class MoviesBloc {
   MoviesRepository ? _moviesRepository;

   final _moviesDetailsController = StreamController<ApiResponse<MoviesList>>();

  StreamSink<ApiResponse<MoviesList>> get moviesListSink =>
      _moviesDetailsController.sink;

  Stream<ApiResponse<MoviesList>> get moviesListStream =>
      _moviesDetailsController.stream;

  MoviesBloc() {
    _moviesRepository = MoviesRepository();
    fetchMoviesList();
  }

  fetchMoviesList() async {
    moviesListSink.add(ApiResponse.loading('Fetching Movies List...'));
    try {
      MoviesList moviesList = await _moviesRepository!.fetchMoviesList();
      moviesListSink.add(ApiResponse.completed(moviesList));
    } catch (e) {
      moviesListSink.add(ApiResponse.error(e.toString()));
      print(e);
    }
  }


   fetchMoviesListFromDB() async {

   }

  dispose() {
    _moviesDetailsController.close();
  }
}