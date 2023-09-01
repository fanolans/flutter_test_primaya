import 'dart:convert';

class MoviesModel {
  final String title;
  final String year;
  final String runtime;
  final String? poster;

  MoviesModel({
    required this.title,
    required this.year,
    required this.runtime,
    this.poster,
  });

  factory MoviesModel.fromRawJson(String str) =>
      MoviesModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MoviesModel.fromJson(Map<String, dynamic> json) => MoviesModel(
        title: json["Title"],
        year: json["Year"],
        runtime: json["Runtime"],
        poster: json["Poster"],
      );

  Map<String, dynamic> toJson() => {
        "Title": title,
        "Year": year,
        "Runtime": runtime,
        "Poster": poster,
      };
}
