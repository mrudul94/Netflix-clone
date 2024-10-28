import 'package:flutter/material.dart';
import 'package:netflix/models/now_playing_model.dart';
import 'package:netflix/models/top_rated_movies.dart';
import 'package:netflix/models/upcoming_movies.dart';
import 'package:netflix/widgets/now_playing_cards.dart';
import 'package:netflix/widgets/top_ratedcards.dart';
import 'package:netflix/widgets/upcoming_movie_card.dart';
import 'package:netflix/widgets/text_helper.dart';

class SearchPageSection extends StatelessWidget {
  final Future<TopRatedMovieModel> topratedFuture;
  final Future<UpComingMovieModel> upcomingFuture;
  final Future<NowPlayingMovieModel> nowplayingFuture;

  const SearchPageSection({
    Key? key,
    required this.topratedFuture,
    required this.upcomingFuture,
    required this.nowplayingFuture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        buildText(text: 'Now Playing'),
        SizedBox(
          height: 150,
          child: NowPlayingCards(future: nowplayingFuture),
        ),
        buildText(text: 'Top Rated'),
        SizedBox(
          height: 150,
          child: TopRatedCards(future: topratedFuture),
        ),
        buildText(text: 'Up Coming'),
        SizedBox(
          height: 150,
          child: UpcomingMovieCard(future: upcomingFuture),
        ),
      ],
    );
  }
}
