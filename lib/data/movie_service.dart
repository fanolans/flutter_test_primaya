import 'package:dio/dio.dart';
import 'package:flutter_test_primaya/domain/movie_model.dart';

class ApiService {
  final Dio dio = Dio();

  String baseUrl = 'https://my-json-server.typicode.com';

  Future<List<MoviesModel>> getMovieList() async {
    Response response =
        await dio.get('$baseUrl/horizon-code-academy/fake-movies-api/movies');
    if (response.statusCode == 200) {
      return (response.data as List)
          .map((movie) => MoviesModel.fromJson(movie))
          .toList();
    } else {
      throw Exception('Failed to get movies');
    }
  }
}
