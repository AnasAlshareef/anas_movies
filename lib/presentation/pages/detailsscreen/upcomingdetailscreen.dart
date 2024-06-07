import 'package:anas_movies/data/models/upcoming.dart';
import 'package:flutter/material.dart';

import '../../widgets/movies/moviedetailswdget/nowplayingdetailswidget.dart';

class UpComingDetailScreen extends StatelessWidget {
  final UpComing upComing;
  const UpComingDetailScreen({super.key, required this.upComing});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 1, 74, 1),
      body: MovieDetailScreen(
          id: upComing.id!,
          originalTitle: upComing.originalTitle!,
          releseDate: upComing.releaseDate!,
          backdrop: upComing.backdropPath!,
          over: upComing.overview!,
          rating: upComing.voteAverage!,
          lang: upComing.originalLanguage!,
          pop: upComing.popularity!),
    );}
}