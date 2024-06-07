import 'package:anas_movies/data/models/nowplaying.dart';
import 'package:anas_movies/presentation/widgets/movies/moviedetailswdget/nowplayingdetailswidget.dart';
import 'package:flutter/material.dart';

class NowPlayingDetailScreen extends StatelessWidget {
  final NowPlaying nowPlaying;

  const NowPlayingDetailScreen({super.key, required this.nowPlaying});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(5, 1, 74, 1),
      body: MovieDetailScreen(
          id: nowPlaying.id!,
          originalTitle: nowPlaying.originalTitle!,
          releseDate: nowPlaying.releaseDate!,
          backdrop: nowPlaying.backdropPath!,
          over: nowPlaying.overview!,
          rating: nowPlaying.voteAverage!,
          lang: nowPlaying.originalLanguage!,
          pop: nowPlaying.popularity!),
    );
  }
}
