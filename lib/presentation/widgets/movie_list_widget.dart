import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_primaya/providers/movie_provider.dart';

class ListWidget extends ConsumerWidget {
  const ListWidget({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final movieData = ref.watch(moviesDataProvider);
    return movieData.when(
      loading: () => const Center(
        child: CircularProgressIndicator(),
      ),
      data: (movieData) {
        return ListView.builder(
          itemCount: movieData.length,
          itemBuilder: (_, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Card(
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title: ${movieData[index].title}',
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Year: ${movieData[index].year}',
                        style: const TextStyle(color: Colors.black),
                      ),
                      Text(
                        'Runtime: ${movieData[index].runtime}',
                        style: const TextStyle(color: Colors.black),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Poster: ',
                            style: TextStyle(color: Colors.black),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: NetworkImage(
                                  movieData[index].poster.toString(),
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
      error: (error, s) => Text(error.toString()),
    );
  }
}
