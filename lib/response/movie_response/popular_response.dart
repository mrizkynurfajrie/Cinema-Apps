// To parse this JSON data, do
//
//     final popularMovie = popularMovieFromJson(jsonString);

import 'dart:convert';

PopularMovie popularMovieFromJson(String str) =>
    PopularMovie.fromJson(json.decode(str));

String popularMovieToJson(PopularMovie data) => json.encode(data.toJson());

class PopularMovie {
  PopularMovie({
    this.page,
    this.PopularResults,
    this.totalPages,
    this.totalPopularResults,
  });

  int? page;
  List<PopularResult>? PopularResults;
  int? totalPages;
  int? totalPopularResults;

  factory PopularMovie.fromJson(Map<String, dynamic> json) => PopularMovie(
        page: json["page"],
        PopularResults: json["results"] == null
            ? []
            : List<PopularResult>.from(
                json["results"]!.map((x) => PopularResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalPopularResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": PopularResults == null
            ? []
            : List<dynamic>.from(PopularResults!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalPopularResults,
      };
}

class PopularResult {
  PopularResult({
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
  OriginalLanguage? originalLanguage;
  String? originalTitle;
  String? overview;
  double? popularity;
  String? posterPath;
  DateTime? releaseDate;
  String? title;
  bool? video;
  double? voteAverage;
  int? voteCount;

  factory PopularResult.fromJson(Map<String, dynamic> json) => PopularResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage:
            originalLanguageValues.map[json["original_language"]]!,
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
        "original_language": originalLanguageValues.reverse[originalLanguage],
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

enum OriginalLanguage { EN, ES, NO, CN }

final originalLanguageValues = EnumValues({
  "cn": OriginalLanguage.CN,
  "en": OriginalLanguage.EN,
  "es": OriginalLanguage.ES,
  "no": OriginalLanguage.NO
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
