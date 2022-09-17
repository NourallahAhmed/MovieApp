import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movie_flutter/model/AllMovies.dart';

import '../../model/MovieDetails.dart';
import '../MovieDetailsScreen/MovieDetailsScreen.dart';

class movieWidget extends StatelessWidget {
  const movieWidget({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Result movie ;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title:



      Row(
        children:

        [

          //todo -> Image 
         
          Hero(
            tag: '${movie.title}',
            child: Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(30),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage('https://image.tmdb.org/t/p/w500/${movie.posterPath ?? " "}')
                  )
              ),
            ),
          ),

          SizedBox(height: 20,),
          Expanded(
            child:
                Padding(
                      padding: const EdgeInsets.all(20.0),

                      child: Column(
                              crossAxisAlignment:CrossAxisAlignment.start,
                              children: [
                                Text(movie.title! , style: TextStyle(color: Colors.deepPurpleAccent)),
                                const SizedBox(height: 20,),
                                Text('popularity : ${movie.popularity}'),
                                // const SizedBox(height: 20,),
                                // Text('Rate : ${movie.voteAverage}'),
                  ]
                              ),
                )
          )
        ],),

      onTap:(){
        Navigator.of(context).push(MaterialPageRoute(builder: (context)=> MovieDetailsScreen(movie: movie)));
      },
    );
  }
}


