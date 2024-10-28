import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/top_rated_movies.dart';
import 'package:netflix/screens/movie_details_page.dart';

class TopRatedCards extends StatefulWidget {
  final Future<TopRatedMovieModel> future;
  const TopRatedCards({super.key, required this.future});

  @override
  State<TopRatedCards> createState() => _TopRatedCardsState();
}

class _TopRatedCardsState extends State<TopRatedCards> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<TopRatedMovieModel>(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasData && snapshot.data != null) {
          var data = snapshot.data!.results;
          return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 8,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MovieDetailsPage(
                                movieId: data[index].id,
                              ))),
                  child: Card(
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.network(
                            '$imageUrl${data[index].posterPath}')),
                  ),
                ),
              );
            },
          );
        } else {
          return const Center(child: Text("No data available"));
        }
      },
    );
  }
}
