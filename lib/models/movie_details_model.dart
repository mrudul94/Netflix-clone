

class MovieDetailsModel {
    bool adult;
    String backdropPath;
    BelongsToCollection belongsToCollection;
    int budget;
    List<Genre> genres;
    String homepage;
    int id;
    String imdbId;
    List<String> originCountry;
    String originalLanguage;
    String originalTitle;
    String overview;
    double popularity;
    String posterPath;
    List<ProductionCompany> productionCompanies;
    List<ProductionCountry> productionCountries;
    DateTime releaseDate;
    int revenue;
    int runtime;
    List<SpokenLanguage> spokenLanguages;
    String status;
    String tagline;
    String title;
    bool video;
    double voteAverage;
    int voteCount;

    MovieDetailsModel({
        required this.adult,
        required this.backdropPath,
        required this.belongsToCollection,
        required this.budget,
        required this.genres,
        required this.homepage,
        required this.id,
        required this.imdbId,
        required this.originCountry,
        required this.originalLanguage,
        required this.originalTitle,
        required this.overview,
        required this.popularity,
        required this.posterPath,
        required this.productionCompanies,
        required this.productionCountries,
        required this.releaseDate,
        required this.revenue,
        required this.runtime,
        required this.spokenLanguages,
        required this.status,
        required this.tagline,
        required this.title,
        required this.video,
        required this.voteAverage,
        required this.voteCount,
    });

    factory MovieDetailsModel.fromJson(Map<String, dynamic> json) => MovieDetailsModel(
        adult: json["adult"],
        backdropPath: json["backdrop_path"] ?? '', // Default to empty string if null
        belongsToCollection: BelongsToCollection.fromJson(json["belongs_to_collection"] ?? {}), // Handle null case
        budget: json["budget"],
        genres: List<Genre>.from(json["genres"].map((x) => Genre.fromJson(x))),
        homepage: json["homepage"] ?? '', // Default to empty string if null
        id: json["id"],
        imdbId: json["imdb_id"] ?? '', // Default to empty string if null
        originCountry: List<String>.from(json["origin_country"]?.map((x) => x) ?? []), // Handle null case
        originalLanguage: json["original_language"] ?? '', // Default to empty string if null
        originalTitle: json["original_title"] ?? '', // Default to empty string if null
        overview: json["overview"] ?? '', // Default to empty string if null
        popularity: json["popularity"]?.toDouble() ?? 0.0, // Default to 0.0 if null
        posterPath: json["poster_path"] ?? '', // Default to empty string if null
        productionCompanies: List<ProductionCompany>.from(json["production_companies"].map((x) => ProductionCompany.fromJson(x))),
        productionCountries: List<ProductionCountry>.from(json["production_countries"].map((x) => ProductionCountry.fromJson(x))),
        releaseDate: DateTime.parse(json["release_date"]),
        revenue: json["revenue"],
        runtime: json["runtime"],
        spokenLanguages: List<SpokenLanguage>.from(json["spoken_languages"].map((x) => SpokenLanguage.fromJson(x))),
        status: json["status"] ?? '', // Default to empty string if null
        tagline: json["tagline"] ?? '', // Default to empty string if null
        title: json["title"] ?? '', // Default to empty string if null
        video: json["video"],
        voteAverage: json["vote_average"]?.toDouble() ?? 0.0, // Default to 0.0 if null
        voteCount: json["vote_count"],
    );

    Map<String, dynamic> toJson() => {
        "adult": adult,
        "backdrop_path": backdropPath,
        "belongs_to_collection": belongsToCollection.toJson(),
        "budget": budget,
        "genres": List<dynamic>.from(genres.map((x) => x.toJson())),
        "homepage": homepage,
        "id": id,
        "imdb_id": imdbId,
        "origin_country": List<dynamic>.from(originCountry.map((x) => x)),
        "original_language": originalLanguage,
        "original_title": originalTitle,
        "overview": overview,
        "popularity": popularity,
        "poster_path": posterPath,
        "production_companies": List<dynamic>.from(productionCompanies.map((x) => x.toJson())),
        "production_countries": List<dynamic>.from(productionCountries.map((x) => x.toJson())),
        "release_date": "${releaseDate.year.toString().padLeft(4, '0')}-${releaseDate.month.toString().padLeft(2, '0')}-${releaseDate.day.toString().padLeft(2, '0')}",
        "revenue": revenue,
        "runtime": runtime,
        "spoken_languages": List<dynamic>.from(spokenLanguages.map((x) => x.toJson())),
        "status": status,
        "tagline": tagline,
        "title": title,
        "video": video,
        "vote_average": voteAverage,
        "vote_count": voteCount,
    };
}

class BelongsToCollection {
  final int? id; // Make this nullable
  final String? name; // Make this nullable
  final String? posterPath; // Make this nullable
  final String? backdropPath; // Make this nullable

  BelongsToCollection({this.id, this.name, this.posterPath, this.backdropPath});

  factory BelongsToCollection.fromJson(Map<String, dynamic> json) {
    return BelongsToCollection(
      id: json['id'], // This can be null
      name: json['name'], // This can be null
      posterPath: json['poster_path'], // This can be null
      backdropPath: json['backdrop_path'], // This can be null
    );
  }



    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "poster_path": posterPath,
        "backdrop_path": backdropPath,
    };
}

class Genre {
    int id;
    String name;

    Genre({
        required this.id,
        required this.name,
    });

    factory Genre.fromJson(Map<String, dynamic> json) => Genre(
        id: json["id"],
        name: json["name"] ?? '', // Default to empty string if null
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
    };
}

class ProductionCompany {
    int id;
    String logoPath;
    String name;
    String originCountry;

    ProductionCompany({
        required this.id,
        required this.logoPath,
        required this.name,
        required this.originCountry,
    });

    factory ProductionCompany.fromJson(Map<String, dynamic> json) => ProductionCompany(
        id: json["id"],
        logoPath: json["logo_path"] ?? '', // Default to empty string if null
        name: json["name"] ?? '', // Default to empty string if null
        originCountry: json["origin_country"] ?? '', // Default to empty string if null
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "logo_path": logoPath,
        "name": name,
        "origin_country": originCountry,
    };
}

class ProductionCountry {
    String iso31661;
    String name;

    ProductionCountry({
        required this.iso31661,
        required this.name,
    });

    factory ProductionCountry.fromJson(Map<String, dynamic> json) => ProductionCountry(
        iso31661: json["iso_3166_1"] ?? '', // Default to empty string if null
        name: json["name"] ?? '', // Default to empty string if null
    );

    Map<String, dynamic> toJson() => {
        "iso_3166_1": iso31661,
        "name": name,
    };
}

class SpokenLanguage {
    String englishName;
    String iso6391;
    String name;

    SpokenLanguage({
        required this.englishName,
        required this.iso6391,
        required this.name,
    });

    factory SpokenLanguage.fromJson(Map<String, dynamic> json) => SpokenLanguage(
        englishName: json["english_name"] ?? '', // Default to empty string if null
        iso6391: json["iso_639_1"] ?? '', // Default to empty string if null
        name: json["name"] ?? '', // Default to empty string if null
    );

    Map<String, dynamic> toJson() => {
        "english_name": englishName,
        "iso_639_1": iso6391,
        "name": name,
    };
}
