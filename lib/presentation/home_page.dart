import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test_primaya/application/movie_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final movieData = ref.watch(moviesDataProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Movies List"),
      ),
      body: movieData.when(
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
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Title: ${movieData[index].title}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Year: ${movieData[index].year}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        'Runtime: ${movieData[index].runtime}',
                        style: const TextStyle(color: Colors.white),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Poster: ',
                            style: TextStyle(color: Colors.white),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height / 3,
                            width: MediaQuery.of(context).size.width / 2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
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
              );
            },
          );
        },
        error: (error, s) => Text(error.toString()),
      ),
    );
  }
}
