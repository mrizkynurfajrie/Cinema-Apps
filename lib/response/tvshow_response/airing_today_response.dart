// To parse this JSON data, do
//
//     final airingTodayTv = airingTodayTvFromJson(jsonString);

import 'dart:convert';

AiringTodayTv airingTodayTvFromJson(String str) =>
    AiringTodayTv.fromJson(json.decode(str));

String airingTodayTvToJson(AiringTodayTv data) => json.encode(data.toJson());

class AiringTodayTv {
  AiringTodayTv({
    this.page,
    this.AiringTodayTvResults,
    this.totalPages,
    this.totalAiringTodayTvResults,
  });

  int? page;
  List<AiringTodayTvResult>? AiringTodayTvResults;
  int? totalPages;
  int? totalAiringTodayTvResults;

  factory AiringTodayTv.fromJson(Map<String, dynamic> json) => AiringTodayTv(
        page: json["page"],
        AiringTodayTvResults: json["results"] == null
            ? []
            : List<AiringTodayTvResult>.from(
                json["results"]!.map((x) => AiringTodayTvResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalAiringTodayTvResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": AiringTodayTvResults == null
            ? []
            : List<dynamic>.from(AiringTodayTvResults!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalAiringTodayTvResults,
      };
}

class AiringTodayTvResult {
  AiringTodayTvResult({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.popularity,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
  });

  String? backdropPath;
  DateTime? firstAirDate;
  List<int>? genreIds;
  int? id;
  String? name;
  List<String>? originCountry;
  String? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

  factory AiringTodayTvResult.fromJson(Map<String, dynamic> json) =>
      AiringTodayTvResult(
        backdropPath: json["backdrop_path"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        name: json["name"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
        originalLanguage: json["original_language"],
        originalName: json["original_name"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "first_air_date":
            "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "name": name,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguage,
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}
