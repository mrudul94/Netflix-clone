// ignore_for_file: constant_identifier_names

import 'dart:convert';

class SearchMovieModel {
    int page;
    List<Result> results;
    int totalPages;
    int totalResults;

    SearchMovieModel({
        required this.page,
        required this.results,
        required this.totalPages,
        required this.totalResults,
    });

    SearchMovieModel copyWith({
        int? page,
        List<Result>? results,
        int? totalPages,
        int? totalResults,
    }) => 
        SearchMovieModel(
            page: page ?? this.page,
            results: results ?? this.results,
            totalPages: totalPages ?? this.totalPages,
            totalResults: totalResults ?? this.totalResults,
        );

    factory SearchMovieModel.fromRawJson(String str) => SearchMovieModel.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory SearchMovieModel.fromJson(Map<String, dynamic> json) => SearchMovieModel(
        page: json["page"],
        results: List<Result>.from(json["results"].map((x) => Result.fromJson(x))),
        totalPages: json["total_pages"],
        totalResults: json["total_results"],
    );

    Map<String, dynamic> toJson() => {
        "page": page,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
        "total_pages": totalPages,
        "total_results": totalResults,
    };
}

class Result {
  bool adult;
  String? backdropPath;
  List<int>? genreIds;
  int id;
  String originalLanguage;
  Title? originalTitle;
  Overview? overview;
  double popularity;
  String? posterPath;
  String? releaseDate;
  Title? title;
  bool video;
  double voteAverage;
  int voteCount;

  Result({
    required this.adult,
    this.backdropPath,
    this.genreIds,
    required this.id,
    required this.originalLanguage,
    this.originalTitle,
    this.overview,
    required this.popularity,
    this.posterPath,
    this.releaseDate,
    this.title,
    required this.video,
    required this.voteAverage,
    required this.voteCount,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
        adult: json["adult"],
        backdropPath: json["backdrop_path"],
        genreIds: json["genre_ids"] != null ? List<int>.from(json["genre_ids"].map((x) => x)) : null,
        id: json["id"],
        originalLanguage: json["original_language"],
        originalTitle: json["original_title"] != null ? titleValues.map[json["original_title"]] : null,
        overview: json["overview"] != null ? overviewValues.map[json["overview"]] : null,
        popularity: json["popularity"]?.toDouble() ?? 0.0,
        posterPath: json["poster_path"],
        releaseDate: json["release_date"],
        title: json["title"] != null ? titleValues.map[json["title"]] : null,
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble() ?? 0.0,
        voteCount: json["vote_count"] ?? 0,
      );

  Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "genre_ids": genreIds != null ? List<dynamic>.from(genreIds!.map((x) => x)) : null,
        "id": id,
        "original_language": originalLanguage,
        "original_title": originalTitle != null ? titleValues.reverse[originalTitle] : null,
        "overview": overview != null ? overviewValues.reverse[overview] : null,
        "popularity": popularity,
        "poster_path": posterPath,
        "release_date": releaseDate,
        "title": title != null ? titleValues.reverse[title] : null,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
      };
}


enum Title {
    EMPTY,
    LOVE_AND_HATE
}

final titleValues = EnumValues({
    ".": Title.EMPTY,
    "Love and Hate": Title.LOVE_AND_HATE
});

enum Overview {
    EMPTY,
    SHORT_FILM_BY_IGNAZIO_FABIO_MAZZOLA
}

final overviewValues = EnumValues({
    "": Overview.EMPTY,
    "Short film by Ignazio Fabio Mazzola.": Overview.SHORT_FILM_BY_IGNAZIO_FABIO_MAZZOLA
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
