import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_primaya/repositories/movie_service.dart';
import 'package:flutter_test_primaya/models/movie_model.dart';

final moviesProvider = Provider<ApiService>((ref) => ApiService());

final moviesDataProvider = FutureProvider<List<MoviesModel>>((ref) async {
  return ref.watch(moviesProvider).getMovieList();
});
