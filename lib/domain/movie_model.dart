import 'dart:convert';

class MoviesModel {
  final String title;
  final String year;
  final String runtime;
  final String poster;
  MoviesModel({
    required this.title,
    required this.year,
    required this.runtime,
    required this.poster,
  });

  MoviesModel copyWith({
    String? title,
    String? year,
    String? runtime,
    String? poster,
  }) {
    return MoviesModel(
      title: title ?? this.title,
      year: year ?? this.year,
      runtime: runtime ?? this.runtime,
      poster: poster ?? this.poster,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'year': year,
      'runtime': runtime,
      'poster': poster,
    };
  }

  factory MoviesModel.fromMap(Map<String, dynamic> map) {
    return MoviesModel(
      title: map['title'] ?? '',
      year: map['year'] ?? '',
      runtime: map['runtime'] ?? '',
      poster: map['poster'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MoviesModel.fromJson(String source) =>
      MoviesModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MoviesModel(title: $title, year: $year, runtime: $runtime, poster: $poster)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MoviesModel &&
        other.title == title &&
        other.year == year &&
        other.runtime == runtime &&
        other.poster == poster;
  }

  @override
  int get hashCode {
    return title.hashCode ^ year.hashCode ^ runtime.hashCode ^ poster.hashCode;
  }
}
