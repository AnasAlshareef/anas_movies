import 'package:anas_movies/cubit/movies/favorites/favorites_cubit.dart';
import 'package:anas_movies/cubit/movies/nowplaying/nowplaying_cubit.dart';
import 'package:anas_movies/cubit/movies/popular/popular_cubit.dart';
import 'package:anas_movies/cubit/movies/toprated/toprated_cubit.dart';
import 'package:anas_movies/cubit/movies/upcoming/upcoming_cubit.dart';

import 'package:anas_movies/data/models/nowplaying.dart';
import 'package:anas_movies/data/models/popularmovies.dart';
import 'package:anas_movies/data/models/toprated.dart';
import 'package:anas_movies/data/models/upcoming.dart';
import 'package:anas_movies/data/repository/repo.dart';
import 'package:anas_movies/data/server/webservices.dart';
import 'package:anas_movies/presentation/pages/detailsscreen/nowplayingdetailscreen.dart';
import 'package:anas_movies/presentation/pages/detailsscreen/populardetailscreen.dart';
import 'package:anas_movies/presentation/pages/detailsscreen/topdetailscreen.dart';
import 'package:anas_movies/presentation/pages/detailsscreen/upcomingdetailscreen.dart';
import 'package:anas_movies/presentation/widgets/bottomnav/bottomnav.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic>? onGenarateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
            builder: (_) => MultiBlocProvider(
                  providers: [
                    BlocProvider(
                        create: (_) => NowplayingCubit(RepoIm(WebServices()))),
                    BlocProvider(
                        create: (_) => PopularCubit(RepoIm(WebServices()))),
                    BlocProvider(
                        create: (_) => TopratedCubit(RepoIm(WebServices()))),
                    BlocProvider(
                        create: (_) => UpcomingCubit(RepoIm(WebServices()))),
                    BlocProvider(
                      create: (_) => FavoritesCubit(RepoIm(WebServices())),
                    )
                  ],
                  child: BottomNavBar(),
                ));
      case 'NowplayingDetails':
        final now = settings.arguments as NowPlaying;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FavoritesCubit(RepoIm(WebServices())),
            child: NowPlayingDetailScreen(nowPlaying: now),
          ),
        );
        case 'popularDetails':
        final pop = settings.arguments as PopularMovies;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FavoritesCubit(RepoIm(WebServices())),
            child: PopulaDetailScreen(popularMovies: pop),
          ),
        );
        case 'topDetails':
        final top = settings.arguments as TopRated;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FavoritesCubit(RepoIm(WebServices())),
            child: TopDetailScreen(topRated: top),
          ),
        );
        case 'upcomingDetails':
        final up = settings.arguments as UpComing;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => FavoritesCubit(RepoIm(WebServices())),
            child: UpComingDetailScreen(upComing: up),
          ),
        );

    }
    return null;
  }
}
