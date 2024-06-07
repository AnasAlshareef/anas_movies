import 'package:anas_movies/data/models/popularmovies.dart';
import 'package:flutter/material.dart';

import '../../widgets/movies/moviedetailswdget/nowplayingdetailswidget.dart';

class PopulaDetailScreen extends StatelessWidget {
  final PopularMovies popularMovies;
   const PopulaDetailScreen({super.key, required this.popularMovies});

   @override
   Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: const Color.fromRGBO(5, 1, 74, 1),
       body: MovieDetailScreen(
           id: popularMovies.id!,
           originalTitle: popularMovies.originalTitle!,
           releseDate: popularMovies.releaseDate!,
           backdrop: popularMovies.backdropPath!,
           over: popularMovies.overview!,
           rating: popularMovies.voteAverage!,
           lang: popularMovies.originalLanguage!,
           pop: popularMovies.popularity!),
     );
   }
 }
