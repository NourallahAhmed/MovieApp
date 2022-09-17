import 'package:flutter/material.dart';
import 'package:movie_flutter/model/AllMovies.dart';

import '../../model/AllMovies.dart';
import '../../repo/Repo.dart';

class AllMovieProvider extends ChangeNotifier{
  List<Result> movies = [];
  Repo RepoInstance = Repo();


  AllMovieProvider(){
    getMovies();
  }
  void getMovies(){
    RepoInstance.getAllMovies().then(
            (value) {
              movies = value!;

          notifyListeners();
        });
  }
}