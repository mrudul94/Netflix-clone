import 'package:flutter/material.dart';
import 'package:netflix/models/now_playing_model.dart';
import 'package:netflix/screens/movie_details_page.dart';

import '../common/utils.dart';

class NowPlayingCards extends StatefulWidget {
  final Future<NowPlayingMovieModel> future;
  const NowPlayingCards({super.key, required this.future});

  @override
  State<NowPlayingCards> createState() => _NowPlayingCardsState();
}

class _NowPlayingCardsState extends State<NowPlayingCards> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<NowPlayingMovieModel>(
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
