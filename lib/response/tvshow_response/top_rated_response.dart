// To parse this JSON data, do
//
//     final topRatedTv = topRatedTvFromJson(jsonString);

import 'dart:convert';

TopRatedTv topRatedTvFromJson(String str) =>
    TopRatedTv.fromJson(json.decode(str));

String topRatedTvToJson(TopRatedTv data) => json.encode(data.toJson());

class TopRatedTv {
  TopRatedTv({
    this.page,
    this.TopRatedTvResults,
    this.totalPages,
    this.totalTopRatedTvResults,
  });

  int? page;
  List<TopRatedTvResult>? TopRatedTvResults;
  int? totalPages;
  int? totalTopRatedTvResults;

  factory TopRatedTv.fromJson(Map<String, dynamic> json) => TopRatedTv(
        page: json["page"],
        TopRatedTvResults: json["results"] == null
            ? []
            : List<TopRatedTvResult>.from(
                json["results"]!.map((x) => TopRatedTvResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalTopRatedTvResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": TopRatedTvResults == null
            ? []
            : List<dynamic>.from(TopRatedTvResults!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalTopRatedTvResults,
      };
}

class TopRatedTvResult {
  TopRatedTvResult({
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
  List<OriginCountry>? originCountry;
  OriginalLanguage? originalLanguage;
  String? originalName;
  String? overview;
  double? popularity;
  String? posterPath;
  double? voteAverage;
  int? voteCount;

  factory TopRatedTvResult.fromJson(Map<String, dynamic> json) =>
      TopRatedTvResult(
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
            : List<OriginCountry>.from(json["origin_country"]!
                .map((x) => originCountryValues.map[x]!)),
        originalLanguage:
            originalLanguageValues.map[json["original_language"]]!,
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
            : List<dynamic>.from(
                originCountry!.map((x) => originCountryValues.reverse[x])),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_name": originalName,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}

enum OriginCountry { US, JP, CA, KR }

final originCountryValues = EnumValues({
  "CA": OriginCountry.CA,
  "JP": OriginCountry.JP,
  "KR": OriginCountry.KR,
  "US": OriginCountry.US
});

enum OriginalLanguage { EN, JA, KO }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "ja": OriginalLanguage.JA,
  "ko": OriginalLanguage.KO
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
