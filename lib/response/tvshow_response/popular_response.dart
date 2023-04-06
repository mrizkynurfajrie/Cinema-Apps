// To parse this JSON data, do
//
//     final popularTv = popularTvFromJson(jsonString);

import 'dart:convert';

PopularTv popularTvFromJson(String str) => PopularTv.fromJson(json.decode(str));

String popularTvToJson(PopularTv data) => json.encode(data.toJson());

class PopularTv {
  PopularTv({
    this.page,
    this.PopularTvResults,
    this.totalPages,
    this.totalPopularTvResults,
  });

  int? page;
  List<PopularTvResult>? PopularTvResults;
  int? totalPages;
  int? totalPopularTvResults;

  factory PopularTv.fromJson(Map<String, dynamic> json) => PopularTv(
        page: json["page"],
        PopularTvResults: json["results"] == null
            ? []
            : List<PopularTvResult>.from(
                json["results"]!.map((x) => PopularTvResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalPopularTvResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": PopularTvResults == null
            ? []
            : List<dynamic>.from(PopularTvResults!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalPopularTvResults,
      };
}

class PopularTvResult {
  PopularTvResult({
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

  factory PopularTvResult.fromJson(Map<String, dynamic> json) =>
      PopularTvResult(
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
