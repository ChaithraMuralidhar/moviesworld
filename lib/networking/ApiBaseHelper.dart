import 'dart:convert';
import 'dart:io';
import 'package:flutterkit/networking/APIExceptions.dart';
import 'package:http/http.dart' as http;



class ApiBaseHelper {

  String kAPI = "";
  
final String _baseUrl = "https://imdb-api.com/API/Top250Movies/k_aei47ah3" ;
    //"https://game-of-thrones-quotes.herokuapp.com/v1/";

Future<dynamic> get(String url) async {
    var responseJson;
    try {
      final response = await http.get(Uri.parse( _baseUrl));
      responseJson = _returnResponse(response);
    } on SocketException {
      throw FetchDataException('No Internet connection');
    }
    return responseJson;
}

dynamic _returnResponse(http.Response response) {
  switch (response.statusCode) {
    case 200:
      var responseJson = json.decode(response.body.toString());
      return responseJson;
    case 400:
      throw BadRequestException(response.body.toString());
    case 401:
    case 403:
      throw UnauthorisedException(response.body.toString());
    case 500:
    default:
      throw FetchDataException(
          'Error occured while Communication with Server with StatusCode : ${response.statusCode}');
  }
  }

  Future<String> networkImageToBase64(String imageUrl) async {
    http.Response response = await http.get(Uri.parse( imageUrl));
    final bytes = response?.bodyBytes;
   // print("decodedstring  $base64Encode(bytes!)");
    return (bytes != null ? base64Encode(bytes) : "");
  }
}