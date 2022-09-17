import 'dart:developer';

import '../LocalRepo/DataBaseHelper.dart';
import '../model/AllMovies.dart';
import '../services/Services.dart';
import 'package:connectivity/connectivity.dart';


class Repo {
  Services myService = Services();

  Future<List<Result>?> getAllMovies() async {
    //todo-> check connectivity
    var connectivityResult = await (Connectivity().checkConnectivity());
    final dbHelper = DbHelper.instance;

    //todo-> if no internet connected return the saved movies

    print(connectivityResult);
    if (connectivityResult == ConnectivityResult.none) {
      final savedMovies = await dbHelper.queryAllRows();
      print("entered the connectivity");
      var data = List<Result>.from(savedMovies.map((savedPost) =>
          Result.fromJson(savedPost)));
      print("from repo ${data.first}");
      return data; // List of movie
    }

    else {
      final fetchedMovies = await myService.fetchingAllMovies(); // Movie
      for (final movie in fetchedMovies.results!) {
        dbHelper.insert(movie.toMap());
        print(movie.title);
      }
      return fetchedMovies.results;
    }
  }
}
  // Future<List<MovieDetails>> getMovieDetails({var id = String}){
  //   return myService.fetchingMovieDetails(Id: id);
  // }
