import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/movie_details_model.dart';
import 'package:netflix/models/movie_recommendation.dart';
import 'package:netflix/screens/download.dart';
import 'package:netflix/screens/search_screen.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/widgets/Iicon_widget.dart';
import 'package:netflix/widgets/build_icon.dart';
import 'package:netflix/widgets/movie_details_helper.dart';
import 'package:netflix/widgets/text_helper.dart';

class MovieDetailsPage extends StatefulWidget {
  final int movieId;

  const MovieDetailsPage({super.key, required this.movieId});

  @override
  State<MovieDetailsPage> createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  late Future<MovieRecommendationModel> recommendationsFuture;
  final ApiServices apiServices = ApiServices();
  late Future<MovieDetailsModel> movieDetails;
  bool isPressed = false;

  @override
  void initState() {
    super.initState();
    fetchDetails();
  }

  fetchDetails() {
    movieDetails = apiServices.getMovieDetails(widget.movieId);
    recommendationsFuture = apiServices.getMovieRecommendation(widget.movieId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Download()));
              },
              icon: const Icon(
                Icons.file_download_outlined,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
          InkWell(
            onTap: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const SearchScreen())),
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(Icons.search, color: Colors.white, size: 30),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: movieDetails,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movie = snapshot.data;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MovieDetailsWidget(
                    imageUrl: imageUrl,
                    movie: movie,
                  ),
                  Column(
                    children: [
                      CustomButton(
                        label: 'Play',
                        icon: Icons.play_arrow,
                        backgroundColor: Colors.white,
                        color: Colors.black,
                        onPressed: () {},
                      ),
                      CustomButton(
                        label: 'Download',
                        icon: Icons.download,
                        backgroundColor: const Color.fromARGB(255, 41, 40, 40),
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          movie!.overview,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            buildIconColumn(
                                isPressed ? Icons.check : Icons.add, 'My List',
                                () {
                              setState(() {
                                isPressed = !isPressed;
                              });
                            }),
                            buildIconColumn(
                                Icons.rate_review_outlined, 'Rate Us', () {}),
                            buildIconColumn(Icons.share, 'Share', () {}),
                          ],
                        ),
                      ),
                      FutureBuilder(
                        future: recommendationsFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child:
                                    CircularProgressIndicator()); 
                          }

                          if (snapshot.hasError) {
                            return Center(
                                child: Text(
                                    'Error: ${snapshot.error}')); 
                          }

                          if (snapshot.hasData) {
                            final movie = snapshot.data;

                            return movie!.results.isEmpty
                                ? const SizedBox()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      buildText(text: 'More Like This'),
                                      const SizedBox(height: 20),
                                      GridView.builder(
                                        shrinkWrap: true,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        gridDelegate:
                                            const SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 3,
                                          mainAxisSpacing: 15,
                                          crossAxisSpacing: 3,
                                          childAspectRatio: 1.5 / 2,
                                        ),
                                        itemCount: movie.results
                                            .length, 
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () => Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        MovieDetailsPage(
                                                          movieId: movie
                                                              .results[index]
                                                              .id,
                                                        ))),
                                            child: Card(
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                child: Image.network(
                                                  '$imageUrl${movie.results[index].posterPath}',
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                          );
                                        },
                                      ),
                                    ],
                                  );
                          }

                          return const Text('No data available');
                        },
                      )
                    ],
                  ),
                ],
              );
            } else {
              return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
