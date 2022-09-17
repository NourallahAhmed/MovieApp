


import 'package:flutter/material.dart';
import 'package:movie_flutter/UI/AllMoviesScreen/AllMovieProvider.dart';
import 'package:provider/provider.dart';

import 'movieWidget.dart';


class AllMovieScreen extends StatefulWidget {
  const AllMovieScreen({Key? key}) : super(key: key);

  @override
  State<AllMovieScreen> createState() => _AllMovieScreenState();
}
class _AllMovieScreenState extends  State<AllMovieScreen>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moives"),
      ),
      body:
      ChangeNotifierProvider<AllMovieProvider>(
        create: (context) => AllMovieProvider(),
        child: Consumer<AllMovieProvider>(
          builder: (buildContext, movieProvider , _) {
            return(movieProvider.movies != null)?

                ListView.builder(
                    itemCount: movieProvider.movies.length ,
                    itemBuilder: (cxt , index){
                      final movie = movieProvider.movies[index];
                      return movieWidget(movie: movie);
                    }
                ): Center(child: CircularProgressIndicator(),);
          },
        ),
      )
    );

    throw UnimplementedError();
  }


}