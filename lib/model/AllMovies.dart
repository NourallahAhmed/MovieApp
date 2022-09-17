import 'dart:convert';

import '../LocalRepo/DataBaseHelper.dart';

Movie movieFromJson(String str) => Movie.fromJson(json.decode(str));

String movieToJson(Movie data) => json.encode(data.toJson());

class Movie {
  Movie({
    this.page,
    this.results,
    this.totalPages,
    this.totalResults,
  });

  int? page;
  List<Result>? results;
  int? totalPages;
  int? totalResults;

  factory Movie.fromJson(Map<String, dynamic> json) => Movie(
    page: json["page"],
    results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
    totalPages: json["total_pages"],
    totalResults: json["total_results"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "results": List<dynamic>.from(results!.map((x) => x.toJson())),
    "total_pages": totalPages,
    "total_results": totalResults,
  };
}

class Result {
  Result({
    // this.adult,
    // this.backdropPath,
    // this.genreIds,
    this.id,
    // this.originalLanguage,
    this.originalTitle,
    // this.overview,
    this.popularity,
    this.posterPath,
    // this.releaseDate,
    this.title,
    // this.video,
    // this.voteAverage,
    this.voteCount,
  });

  // bool? adult;
  // String? backdropPath;
  // List<int>? genreIds;
  int? id;
  // OriginalLanguage? originalLanguage;
  String? originalTitle;
  // String? overview;
  double? popularity;
  String? posterPath;
  // DateTime? releaseDate;
  String? title;
  // bool? video;
  // double? voteAverage;
  int? voteCount;

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    // adult: json["adult"],
    // backdropPath: json["backdrop_path"],
    // genreIds: List<int>.from(json["genre_ids"].map((x) => x)) ,
    id: json["id"],
    // originalLanguage: originalLanguageValues.map[json["original_language"]],
    originalTitle: json["original_title"] ,
    // overview: json["overview"] ,
    popularity: json["popularity"].toDouble(),
    posterPath: json["poster_path"],
    // releaseDate: DateTime.parse(json["release_date"]) != null ? null: null ,
    title: json["title"],
    // video: json["video"] ,
    // voteAverage: json["vote_average"].toDouble(),
    voteCount: json["vote_count"],
  );

  //todo -> map
  Map<String, dynamic> toMap(){
    return {
      // DbHelper.COLUMN_ID:id,
      // DbHelper.COLUMN_RELEASEDATE:releaseDate,
      DbHelper.COLUMN_TITLE:title,
      DbHelper.COLUMN_POPULARITY:popularity,
      DbHelper.COLUMN_MOVIE_TITLE : posterPath,
      DbHelper.COLUMN_VOTECOUNT : voteCount,
      // DbHelper.COLUMN_VOTEAVERAGE : voteAverage,
    };
  }



  Map<String, dynamic> toJson() => {
    // "adult": adult,
    // "backdrop_path": backdropPath,
    // "genre_ids": List<dynamic>.from(genreIds!.map((x) => x)),
    "id": id,
    // "original_language": originalLanguageValues.reverse[originalLanguage],
    "original_title": originalTitle,
    // "overview": overview,
    "popularity": popularity,
    "poster_path": posterPath,
    // "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
    "title": title,
    // "video": video,
    // "vote_average": voteAverage,
    "vote_count": voteCount,
  };
}

enum OriginalLanguage { EN, FR, ES }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "fr": OriginalLanguage.FR
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}