import 'package:flutter/material.dart';
import 'package:flutterkit/config/palette.dart';
import 'package:flutterkit/networking/ApiResponse.dart';
import 'package:flutterkit/networking/bloc/MoviesBloc.dart';
import 'package:flutterkit/networking/model/MoviesList.dart';
import 'package:flutterkit/pages/navigation_drawer/navigation_drawer.dart';
import 'package:flutterkit/pages/api_services/widgets/DetailsWidget.dart';
import '../../../db/database.dart';
import '../../../networking/ApiBaseHelper.dart';
import '../../../networking/model/Movie.dart';
import 'package:cached_network_image/cached_network_image.dart';

class APIWidget extends StatefulWidget {
 // const APIWidget({Key? key}) : super(key: key);
  final _APIWidgetState myAppState = new _APIWidgetState();
  @override
  _APIWidgetState createState() => _APIWidgetState();

  static void saveToDB() {
    _APIWidgetState.saveToDB();
  }

}

class _APIWidgetState extends State<APIWidget> {
  late MoviesBloc _bloc;
 static  List<Movie> moviesList = [] ;
 static BuildContext? dialogueContext;
  @override
  void initState() {
    super.initState();
    _bloc = MoviesBloc();
  }

  @override
  Widget build(BuildContext context) {
    late Movie selectedMovie;
    dialogueContext = context;
    return Column(
      children: [
        Expanded (child: RefreshIndicator(
          onRefresh: () => _bloc.fetchMoviesList(),
          child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: StreamBuilder<ApiResponse<MoviesList>>(
                stream:
                _bloc.moviesListStream,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    switch (snapshot.data!.status) {
                      case Status.LOADING:
                        return  Text(
                            "Loading....",
                            style: const TextStyle(color: Colors.black54, fontSize: 30)
                        );
                      case Status.COMPLETED:
                        MoviesList list1  = snapshot.data?.data as MoviesList;
                        moviesList = list1.items;
                       return ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemCount: moviesList.length,
                          itemBuilder: (context, index) {
                            selectedMovie = moviesList[index];
                            String selMovie = selectedMovie.title;
                           var ratingValue = moviesList[index].imDbRating;
                           var imageUrl = moviesList[index].image;
                            return Card(
                              child: ListTile( //Image.network(imageUrl)
                                leading:  Container(child:CachedNetworkImage(
                                  placeholder: (context, url) =>
                                  const CircularProgressIndicator(),
                                  imageUrl: imageUrl,
                                ),
                                ),
                                title: Text(moviesList[index].title,
                                    style: TextStyle(fontSize: 16),
                                    maxLines : 2),
                                subtitle: Text("Rating: $ratingValue ",
                                    style: TextStyle(fontWeight: FontWeight. bold)),
                                trailing: Icon(Icons.arrow_right),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => DetailsWidget(selectedMovie: moviesList[index], isOffline: false,),
                                      ));
                                },
                              ),
                            );
                          },
                        );

                      case Status.ERROR:
                        return Column(
                          children: [Text(
                            snapshot.data!.message,
                            style: const TextStyle(color: Colors.red, fontSize: 20)
                        ),
                            Text(
                                "Please check Offline option for previously saved data",
                                style: const TextStyle(color: Colors.black, fontSize: 20)
                            ),],
                        );
                    }
                  }
                  return Container();
                },
              )
          ),
        ),
    ),
      ],
    );
  }

  static Future<void> saveToDB()  async {
    showCircularProgressBar(dialogueContext!);
    ApiBaseHelper _helper = ApiBaseHelper();
    var count = moviesList.length;
    DBProvider db = DBProvider();
    for ( Movie movie in moviesList) {
      movie.imageBytes = await _helper.networkImageToBase64(movie.image);
    await db.addMovie(movie);
    if (movie == moviesList.last) {
      Navigator.pop(dialogueContext!);
      showAlertView(dialogueContext!);
    }
    }

  }

  static showCircularProgressBar(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Container(child: Center(child :CircularProgressIndicator()),);
      },
    );
  }

    static showAlertView(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Data Saved"),
          );
        },
      );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
