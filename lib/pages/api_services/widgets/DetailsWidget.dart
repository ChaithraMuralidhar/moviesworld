
import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutterkit/db/database.dart';
import '../../../networking/model/Movie.dart';
import '../../../networking/model/MoviesList.dart';
import '../../testingOffline/view/moviesOffline_page.dart';

class DetailsWidget extends StatelessWidget {
  late Movie selectedMovie;
  bool isOffline = false;
  // receive data from the Previous Screen as a parameter
  DetailsWidget({ Key? key, required this.selectedMovie, required this.isOffline}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Movie thisMovie =  this.selectedMovie;

    return Scaffold(
      appBar: AppBar(title: Text(thisMovie.title)),
      body: Container(
        color: Colors.black,
        child : Column (children: [
          Container(decoration : BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: isOffline == true ? Image.memory(ImageDataDecode.getDecodedImage(thisMovie.imageBytes)!).image : NetworkImage(thisMovie.image),
            ),
             ),
            height: MediaQuery.of(context).size.height / 2,
            ),
          SizedBox(height: 10),
          Text(thisMovie.fullTitle.toString(), style: TextStyle(color: Colors.white, fontSize: 22),textAlign: TextAlign.center),
          SizedBox(height: 5),
          Text("Rating: " + thisMovie.imDbRating +"("+ thisMovie.imDbRatingCount + ")", style: TextStyle(color: Colors.blue, fontSize: 16)),
          Text("Rank:"+ thisMovie.rank, style: TextStyle(color: Colors.orangeAccent, fontSize: 16),),
          SizedBox(height: 10),
          const Divider(
            height: 20,
            thickness: 1,
            indent: 5,
            endIndent: 5,
            color: Colors.yellow,
          ),
          SizedBox(height: 10),
          Text("Crew: "+ thisMovie.crew, style: TextStyle(color: Colors.white, fontSize: 18, ),textAlign: TextAlign.center,),

        ],
        ),
      ),
    );
  }
}