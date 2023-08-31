import 'dart:convert';

class MovieModel {
  final String title;
  final String year;
  final String runtime;
  final String poster;
  MovieModel({
    required this.title,
    required this.year,
    required this.runtime,
    required this.poster,
  });

  MovieModel copyWith({
    String? title,
    String? year,
    String? runtime,
    String? poster,
  }) {
    return MovieModel(
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

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      title: map['title'] ?? '',
      year: map['year'] ?? '',
      runtime: map['runtime'] ?? '',
      poster: map['poster'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'MovieModel(title: $title, year: $year, runtime: $runtime, poster: $poster)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MovieModel &&
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
