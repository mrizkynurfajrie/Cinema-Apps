// To parse this JSON data, do
//
//     final movie = movieFromJson(jsonString);

import 'dart:convert';

TopRatedMovie topRatedMovieFromJson(String str) =>
    TopRatedMovie.fromJson(json.decode(str));

String movieToJson(TopRatedMovie data) => json.encode(data.toJson());

class TopRatedMovie {
  TopRatedMovie({
    this.page,
    this.TopRatedResults,
    this.totalPages,
    this.totalTopRatedResults,
  });

  int? page;
  List<TopRatedResult>? TopRatedResults;
  int? totalPages;
  int? totalTopRatedResults;

  factory TopRatedMovie.fromJson(Map<String, dynamic> json) => TopRatedMovie(
        page: json["page"],
        TopRatedResults: json["results"] == null
            ? []
            : List<TopRatedResult>.from(
                json["results"]!.map((x) => TopRatedResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalTopRatedResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": TopRatedResults == null
            ? []
            : List<dynamic>.from(TopRatedResults!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalTopRatedResults,
      };
}

class TopRatedResult {
  TopRatedResult({
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

  bool? adult;
  String? backdropPath;
  List<int>? genreIds;
  int? id;
  String? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  factory TopRatedResult.fromJson(Map<String, dynamic> json) => TopRatedResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
