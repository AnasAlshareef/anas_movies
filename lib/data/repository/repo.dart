import 'package:anas_movies/data/server/webservices.dart';

import '../models/favorites.dart';
import '../models/nowplaying.dart';
import '../models/popularmovies.dart';
import '../models/toprated.dart';
import '../models/upcoming.dart';

abstract class Repo {
  Future<List<PopularMovies>> getPopularMovies();

  Future<List<TopRated>> getTopRated();

  Future<List<UpComing>> getUpComing();

  Future<List<NowPlaying>> getNowPlaying();

  Future<bool> addFavorite(int id, bool isFavorite, String type);

  Future<List<Favorites>> getFavorites();
}

class RepoIm implements Repo {
  final WebServices webServices;

  RepoIm(this.webServices);

  @override
  Future<List<NowPlaying>> getNowPlaying() async {
    return await webServices.getNowPlaying();
  }

  @override
  Future<List<PopularMovies>> getPopularMovies() async {
    return await webServices.getPopularMovies();
  }

  @override
  Future<List<TopRated>> getTopRated() async {
    return await webServices.getTopRated();
  }

  @override
  Future<List<UpComing>> getUpComing() async {
    return await webServices.getUpComing();
  }

  @override
  Future<bool> addFavorite(int id, bool isFavorite, String type) async {
   return await webServices.addFavorite(id, isFavorite, type);
  }

  @override
  Future<List<Favorites>> getFavorites() async {
    return await webServices.getFavorites();
  }
}
