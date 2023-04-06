// To parse this JSON data, do
//
//     final popularPerson = popularPersonFromJson(jsonString);

import 'dart:convert';

PopularPerson popularPersonFromJson(String str) =>
    PopularPerson.fromJson(json.decode(str));

String popularPersonToJson(PopularPerson data) => json.encode(data.toJson());

class PopularPerson {
  PopularPerson({
    this.page,
    this.PopularPersonResults,
    this.totalPages,
    this.totalPopularPersonResults,
  });

  int? page;
  List<PopularPersonResult>? PopularPersonResults;
  int? totalPages;
  int? totalPopularPersonResults;

  factory PopularPerson.fromJson(Map<String, dynamic> json) => PopularPerson(
        page: json["page"],
        PopularPersonResults: json["results"] == null
            ? []
            : List<PopularPersonResult>.from(
                json["results"]!.map((x) => PopularPersonResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalPopularPersonResults: json["total_results"],
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "results": PopularPersonResults == null
            ? []
            : List<dynamic>.from(PopularPersonResults!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalPopularPersonResults,
      };
}

class PopularPersonResult {
  PopularPersonResult({
    this.adult,
    this.gender,
    this.id,
    this.knownFor,
    this.knownForDepartment,
    this.name,
    this.popularity,
    this.profilePath,
  });

  bool? adult;
  int? gender;
  int? id;
  List<KnownFor>? knownFor;
  KnownForDepartment? knownForDepartment;
  String? name;
  double? popularity;
  String? profilePath;

  factory PopularPersonResult.fromJson(Map<String, dynamic> json) =>
      PopularPersonResult(
        adult: json["adult"],
        gender: json["gender"],
        id: json["id"],
        knownFor: json["known_for"] == null
            ? []
            : List<KnownFor>.from(
                json["known_for"]!.map((x) => KnownFor.fromJson(x))),
        knownForDepartment:
            knownForDepartmentValues.map[json["known_for_department"]]!,
        name: json["name"],
        popularity: json["popularity"]?.toDouble(),
        profilePath: json["profile_path"],
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "gender": gender,
        "id": id,
        "known_for": knownFor == null
            ? []
            : List<dynamic>.from(knownFor!.map((x) => x.toJson())),
        "known_for_department":
            knownForDepartmentValues.reverse[knownForDepartment],
        "name": name,
        "popularity": popularity,
        "profile_path": profilePath,
      };
}

class KnownFor {
  KnownFor({
    this.backdropPath,
    this.firstAirDate,
    this.genreIds,
    this.id,
    this.mediaType,
    this.name,
    this.originCountry,
    this.originalLanguage,
    this.originalName,
    this.overview,
    this.posterPath,
    this.voteAverage,
    this.voteCount,
    this.adult,
    this.originalTitle,
    this.releaseDate,
    this.title,
    this.video,
  });

  String? backdropPath;
  DateTime? firstAirDate;
  List<int>? genreIds;
  int? id;
  MediaType? mediaType;
  String? name;
  List<String>? originCountry;
  OriginalLanguage? originalLanguage;
  String? originalName;
  String? overview;
  String? posterPath;
  double? voteAverage;
  int? voteCount;
  bool? adult;
  String? originalTitle;
  DateTime? releaseDate;
  String? title;
  bool? video;

  factory KnownFor.fromJson(Map<String, dynamic> json) => KnownFor(
        backdropPath: json["backdrop_path"],
        firstAirDate: json["first_air_date"] == null
            ? null
            : DateTime.parse(json["first_air_date"]),
        genreIds: json["genre_ids"] == null
            ? []
            : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        mediaType: mediaTypeValues.map[json["media_type"]]!,
        name: json["name"],
        originCountry: json["origin_country"] == null
            ? []
            : List<String>.from(json["origin_country"]!.map((x) => x)),
        originalLanguage:
            originalLanguageValues.map[json["original_language"]]!,
        originalName: json["original_name"],
        overview: json["overview"],
        posterPath: json["poster_path"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
        adult: json["adult"],
        originalTitle: json["original_title"],
        releaseDate: json["release_date"] == null
            ? null
            : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
      );

  Map<String, dynamic> toJson() => {
        "backdrop_path": backdropPath,
        "first_air_date":
            "${firstAirDate!.year.toString().padLeft(4, '0')}-${firstAirDate!.month.toString().padLeft(2, '0')}-${firstAirDate!.day.toString().padLeft(2, '0')}",
        "genre_ids":
            genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "media_type": mediaTypeValues.reverse[mediaType],
        "name": name,
        "origin_country": originCountry == null
            ? []
            : List<dynamic>.from(originCountry!.map((x) => x)),
        "original_language": originalLanguageValues.reverse[originalLanguage],
        "original_name": originalName,
        "overview": overview,
        "poster_path": posterPath,
        "vote_average": voteAverage,
        "vote_count": voteCount,
        "adult": adult,
        "original_title": originalTitle,
        "release_date":
            "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
      };
}

enum MediaType { TV, MOVIE }

final mediaTypeValues =
    EnumValues({"movie": MediaType.MOVIE, "tv": MediaType.TV});

enum OriginalLanguage { EN, KO, IT, TL, RU }

final originalLanguageValues = EnumValues({
  "en": OriginalLanguage.EN,
  "it": OriginalLanguage.IT,
  "ko": OriginalLanguage.KO,
  "ru": OriginalLanguage.RU,
  "tl": OriginalLanguage.TL
});

enum KnownForDepartment { ACTING, DIRECTING }

final knownForDepartmentValues = EnumValues({
  "Acting": KnownForDepartment.ACTING,
  "Directing": KnownForDepartment.DIRECTING
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
