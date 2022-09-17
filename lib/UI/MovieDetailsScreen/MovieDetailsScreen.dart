
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_flutter/model/AllMovies.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Result movie;
  const MovieDetailsScreen({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Details'),),
      body: Center(
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            Text('${movie.title}', style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal , color: Colors.deepPurpleAccent)),
            SizedBox(height: 20,),
            Hero(
              tag: '${movie.title}',
              // child: Image(width: 400,
              //     height: 400,
              //     image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.posterPath!}')
              // ),

              child:  Container(
                width: 200,
                height: 300,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.posterPath!}')
                    )
                ),
              ),
            ),
            // SizedBox(height: 22,),
            // Text('releaseDate : ${movie.releaseDate}', style: TextStyle(fontSize: 18 )),
            // SizedBox(height: 22,),
            // Text('This Movie Has a rate : ${movie.voteAverage}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 22,),
            Text('Popularity in : ${movie.popularity}', style: TextStyle(fontSize: 18)),
            SizedBox(height: 22,),
            Text('VoteCount : ${movie.voteCount}', style: TextStyle(fontSize: 18),)

          ],),
      ),
    );
  }
}
