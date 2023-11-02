
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterkit/networking/ApiResponse.dart';
import 'package:flutterkit/networking/bloc/MoviesBloc.dart';
import 'package:flutterkit/networking/model/MoviesList.dart';
import 'package:flutterkit/pages/navigation_drawer/navigation_drawer.dart';
import 'package:flutterkit/pages/api_services/widgets/DetailsWidget.dart';
import '../../../config/palette.dart';
import '../../../db/database.dart';
import '../../../networking/model/Movie.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';


class MoviesOffline extends StatefulWidget {
  // const APIWidget({Key? key}) : super(key: key);
  final _MoviesOfflineState myAppState = new _MoviesOfflineState();

  @override
  _MoviesOfflineState createState() => _MoviesOfflineState();
}
class _MoviesOfflineState extends State<MoviesOffline> {
  late MoviesBloc _bloc;
  late List<Movie> moviesList = [] ;

// late Future<Uint8List?>  decodedBytes;
  DBProvider dbProvider = DBProvider();
  @override
  void initState() {
    super.initState();
    _bloc = MoviesBloc();
  }


  @override
  Widget build(BuildContext context) {
    late Movie selectedMovie;

    return Scaffold(
 drawer: NavigationDrawers(),
        appBar: AppBar(
            title: Text( AppLocalizations.of(context)!.testingOffline),
            backgroundColor: Palette.navigationBar
        ),
        body:FutureBuilder<List<Map>>(
          future: dbProvider.getAllMovies(),//getOfflineMovieData(),//dbProvider.getAllMovies(),//dbProvider.getAllMovies(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {

              List<Map> moviesDataList = snapshot.data as List<Map> ;

              return ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: moviesDataList.length,
                itemBuilder: (context, index) {
                  Map selectedMovieDetails = moviesDataList[index];
                 Movie selectedMovie = Movie(imDbRating: selectedMovieDetails["imDbRating"], rank: selectedMovieDetails["rank"], id: selectedMovieDetails["id"], image: selectedMovieDetails["image"], imageBytes: selectedMovieDetails["imageBytes"], year:  selectedMovieDetails["year"], imDbRatingCount: selectedMovieDetails["imDbRatingCount"], fullTitle: selectedMovieDetails["fullTitle"], title: selectedMovieDetails["title"], crew: selectedMovieDetails["crew"]);

                  String selMovieTitle = selectedMovie.title;
                  var ratingValue = selectedMovie.imDbRating;
                  var imageUrl = selectedMovie.image;
                  var imageData = selectedMovie.imageBytes;

                  return Card(
                    child:  ListTile(
                      // leading:  Container(child: Image.memory(base64Decode(moviesList[index].imageBytes)) ,
                      leading:  Container(child: Image.memory(ImageDataDecode.getDecodedImage(imageData)!) ,
                      ),
                      title: Text(selMovieTitle,
                          style: TextStyle(fontSize: 16),
                          maxLines : 2),
                      subtitle: Text("Rating: $ratingValue ",
                          style: TextStyle(fontWeight: FontWeight. bold)),
                      trailing: Icon(Icons.arrow_right),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsWidget(selectedMovie: selectedMovie, isOffline: true,),
                            ));
                      },
                    ),
                  );
                },
              );
            }
            return Container();
          },
        ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}

class ImageDataDecode {

  static Uint8List? getDecodedImage(String imageData) {
    var stringToAppend = "data:image/png;base64,";
    var memoryBytesString= stringToAppend + imageData;
    UriData? data = Uri.parse(memoryBytesString).data;
    Uint8List? decodedBytes =  data?.contentAsBytes();
    return decodedBytes;
  }

}