import 'package:anas_movies/data/models/toprated.dart';
import 'package:flutter/material.dart';

import '../../widgets/movies/moviedetailswdget/nowplayingdetailswidget.dart';

class TopDetailScreen extends StatelessWidget {
  final TopRated topRated;
  const TopDetailScreen({super.key, required this.topRated});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 1, 74, 1),
      body: MovieDetailScreen(
          id: topRated.id!,
          originalTitle: topRated.originalTitle!,
          releseDate: topRated.releaseDate!,
          backdrop: topRated.backdropPath!,
          over: topRated.overview!,
          rating: topRated.voteAverage!,
          lang: topRated.originalLanguage!,
          pop: topRated.popularity!),
    );
  }
}