import 'dart:convert';

import 'package:anas_movies/data/models/favorites.dart';
import 'package:anas_movies/data/models/nowplaying.dart';
import 'package:anas_movies/data/models/popularmovies.dart';
import 'package:anas_movies/data/models/toprated.dart';
import 'package:anas_movies/data/models/upcoming.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

abstract class Web{
   Future<List<PopularMovies>> getPopularMovies();
   Future<List<TopRated>> getTopRated();
   Future<List<UpComing>> getUpComing();
   Future<List<NowPlaying>> getNowPlaying();
   Future<void> addFavorite (int id , bool isFavorite , String type);
   Future<List<Favorites>> getFavorites();
}


class WebServices implements Web{
  final String apikey = "";

  @override
  Future<List<NowPlaying>> getNowPlaying() async{
    Response response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/now_playing?api_key=$apikey"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['results'];
      return jsonData.map((now) => NowPlaying.fromJson(now)).toList();
    } else {
      throw Exception('${response.reasonPhrase}');
    }
  }

  @override
  Future<List<PopularMovies>> getPopularMovies()async {
    Response response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/popular?api_key=$apikey"));
    if (response.statusCode == 200) {

      final List<dynamic> jsonData = jsonDecode(response.body)['results'];
      //print(jsonData);

      return jsonData.map((M) => PopularMovies.fromJson(M)).toList();
    } else {
      throw Exception('${response.reasonPhrase}');
    }
  }

  @override
  Future<List<TopRated>> getTopRated() async{
    Response response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['results'];
      return jsonData.map((top) => TopRated.fromJson(top)).toList();
    } else {
      throw Exception('${response.reasonPhrase}');
    }
  }

  @override
  Future<List<UpComing>> getUpComing() async{
    Response response = await http.get(Uri.parse("https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey"));
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['results'];
      return jsonData.map((coming) => UpComing.fromJson(coming)).toList();
    } else {
      throw Exception('${response.reasonPhrase}');
    }
  }

  @override
  Future<bool> addFavorite(int id, bool isFavorite, String type) async{
    var headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer '
    };
    var request =http.Request('POST', Uri.parse('https://api.themoviedb.org/3/account/21141457/favorite'));
    request.body = json.encode({
      "media_id": id,
      "media_type": type,
      "favorite": isFavorite
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      final bool k= jsonDecode(request.body)['favorite'];
      print(await response.stream.bytesToString());
         print(k);
      return k;
    }
    else{
      print(response.reasonPhrase);
      return false;
    }
  }

  @override
  Future<List<Favorites>> getFavorites() async{
    Response response = await http.get(Uri.parse('https://api.themoviedb.org/3/account/21141457/favorite/movies'),headers:{
      'Authorization': 'Bearer '
    });
    if (response.statusCode == 200) {
      final List<dynamic> jsonData = jsonDecode(response.body)['results'];
      return jsonData.map((favorites) => Favorites.fromJson(favorites)).toList();
    } else {
    print(response.reasonPhrase);
    return [];
    }
  }
}