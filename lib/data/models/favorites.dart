

import 'dart:convert';

class Favorites  {
  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  String? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  Favorites({
    this.adult,
    this.backdropPath,
    this.genreIds,
    this.id,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  Favorites.fromJson(Map<String, dynamic> json) {
    adult = json['adult'];
    backdropPath = json['backdrop_path'];
    genreIds = json['genre_ids'].cast<int>();
    id = json['id'];
    originalLanguage = json['original_language'];
    originalTitle = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    posterPath = json['poster_path'];
    releaseDate = json['release_date'];
    title = json['title'];
    video = json['video'];
    voteAverage = json['vote_average'];
    voteCount = json['vote_count'];

  }

  Map<String, dynamic> toJson() {
    return {
      "adult": this.adult,
      "backdropPath": this.backdropPath,
      "genreIds": jsonEncode(this.genreIds),
      "id": this.id,
      "originalLanguage": this.originalLanguage,
      "originalTitle": this.originalTitle,
      "overview": this.overview,
      "popularity": this.popularity,
      "posterPath": this.posterPath,
      "releaseDate": this.releaseDate,
      "title": this.title,
      "video": this.video,
      "voteAverage": this.voteAverage,
      "voteCount": this.voteCount,
    };
  }
}