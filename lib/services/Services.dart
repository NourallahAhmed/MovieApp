import 'dart:convert';
import 'package:movie_flutter/model/AllMovies.dart';
import 'package:http/http.dart' as http;
import '../model/MovieDetails.dart';

class Services{

  Future <Movie> fetchingAllMovies() async {
    var url = Uri.parse("https://api.themoviedb.org/4/discover/movie?api_key=ee5128bdcf71a895a1a38509fbf94784"); //&sort_by=popularity.desc

    // will wait a well to get the data from network
    final request1 = await http.get(url); // of type Response
    print(request1.statusCode);
    if (request1.statusCode == 200) {
      return movieFromJson(request1.body);
    }
    else {
      throw Exception("faild to load post");
    }
  }

  // Future<List<MovieDetails>> fetchingMovieDetails({var Id = String }) async {
  //   var url = Uri.parse("https://api.themoviedb.org/3/movie/${Id}?api_key=ee5128bdcf71a895a1a38509fbf94784&language=en-US");
  //
  //   // will wait a well to get the data from network
  //   final request = await http.get(url); // of type Response
  //   print(request.statusCode);
  //   if (request.statusCode == 200) {
  //     return List<MovieDetails>.from((json.decode(request.body) as List).map((e) => MovieDetails.fromJson((e)))).toList();
  //   }
  //   else {
  //     throw Exception("faild to load post");
  //   }
  // }

}