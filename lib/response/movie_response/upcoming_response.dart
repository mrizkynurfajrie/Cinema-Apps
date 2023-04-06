// To parse this JSON data, do
//
//     final upcomingMovie = upcomingMovieFromJson(jsonString);

import 'dart:convert';

UpcomingMovie upcomingMovieFromJson(String str) => UpcomingMovie.fromJson(json.decode(str));

String upcomingMovieToJson(UpcomingMovie data) => json.encode(data.toJson());

class UpcomingMovie {
    UpcomingMovie({
        this.dates,
        this.page,
        this.UpcomingResults,
        this.totalPages,
        this.totalUpcomingResults,
    });

    Dates? dates;
    int? page;
    List<UpcomingResult>? UpcomingResults;
    int? totalPages;
    int? totalUpcomingResults;

    factory UpcomingMovie.fromJson(Map<String, dynamic> json) => UpcomingMovie(
        dates: json["dates"] == null ? null : Dates.fromJson(json["dates"]),
        page: json["page"],
        UpcomingResults: json["results"] == null ? [] : List<UpcomingResult>.from(json["results"]!.map((x) => UpcomingResult.fromJson(x))),
        totalPages: json["total_pages"],
        totalUpcomingResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "dates": dates?.toJson(),
        "page": page,
        "results": UpcomingResults == null ? [] : List<dynamic>.from(UpcomingResults!.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalUpcomingResults,
    };
}

class Dates {
    Dates({
        this.maximum,
        this.minimum,
    });

    DateTime? maximum;
    DateTime? minimum;

    factory Dates.fromJson(Map<String, dynamic> json) => Dates(
        maximum: json["maximum"] == null ? null : DateTime.parse(json["maximum"]),
        minimum: json["minimum"] == null ? null : DateTime.parse(json["minimum"]),
    );

    Map<String, dynamic> toJson() => {
        "maximum": "${maximum!.year.toString().padLeft(4, '0')}-${maximum!.month.toString().padLeft(2, '0')}-${maximum!.day.toString().padLeft(2, '0')}",
        "minimum": "${minimum!.year.toString().padLeft(4, '0')}-${minimum!.month.toString().padLeft(2, '0')}-${minimum!.day.toString().padLeft(2, '0')}",
    };
}

class UpcomingResult {
    UpcomingResult({
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

    factory UpcomingResult.fromJson(Map<String, dynamic> json) => UpcomingResult(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] == null ? [] : List<int>.from(json["genre_ids"]!.map((x) => x)),
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"],
        overview: json["overview"],
        popularity: json["popularity"]?.toDouble(),
        posterPath: json["poster_path"],
        releaseDate: json["release_date"] == null ? null : DateTime.parse(json["release_date"]),
        title: json["title"],
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble(),
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds == null ? [] : List<dynamic>.from(genreIds!.map((x) => x)),
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": "${releaseDate!.year.toString().padLeft(4, '0')}-${releaseDate!.month.toString().padLeft(2, '0')}-${releaseDate!.day.toString().padLeft(2, '0')}",
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}
