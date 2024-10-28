import 'package:flutter/material.dart';
import 'package:netflix/models/upcoming_movies.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/widgets/coming_soon_widget.dart';
import 'package:netflix/widgets/everyones_watching.dart';

import 'download.dart';

class NewAndHot extends StatefulWidget {
  const NewAndHot({super.key});

  @override
  State<NewAndHot> createState() => _NewAndHotState();
}

class _NewAndHotState extends State<NewAndHot> {
  late Future<UpComingMovieModel> upcomingFuture;
  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    super.initState();
    upcomingFuture = apiServices.getUpComingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: const Text(
                'New & Hot',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Download()));
                    },
                    icon: const Icon(
                      Icons.file_download_outlined,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10),
                  child: Icon(Icons.search, color: Colors.white, size: 30),
                ),
              ],
              bottom: TabBar(
                dividerColor: Colors.black,
                isScrollable: false,
                tabs: const [
                  Tab(
                    text: '  🍿Comingsoon  ',
                  ),
                  Tab(
                    text: "🔥Everyone's Watching ",
                  )
                ],
                indicator: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white)),
                labelColor: Colors.black,
                labelStyle:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                unselectedLabelColor: Colors.white,
              ),
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Column(
                    children: [
                      FutureBuilder<UpComingMovieModel>(
                        future: upcomingFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasData &&
                              snapshot.data!.results.isNotEmpty) {
                            final movie = snapshot.data!.results[0];
                            return ComingSoonWidget(
                              imageUrl: movie.posterPath,
                              overView: movie.overview,
                              logourl: movie.backdropPath,
                              month: "Apr",
                              day: "12",
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FutureBuilder<UpComingMovieModel>(
                        future: upcomingFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasData &&
                              snapshot.data!.results.isNotEmpty) {
                            final movie = snapshot.data!.results[1];
                            return ComingSoonWidget(
                              imageUrl: movie.posterPath,
                              overView: movie.overview,
                              logourl: movie.backdropPath,
                              month: "Mar",
                              day: "29",
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                    children: [
                      FutureBuilder<UpComingMovieModel>(
                        future: upcomingFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasData &&
                              snapshot.data!.results.isNotEmpty) {
                            final movie = snapshot.data!.results[2];
                            return EveryoneWatchWidget(
                              imageUrl: movie.posterPath,
                              overview: movie.overview,
                              logourl: movie.backdropPath,
                              month: "Apr",
                              day: "12",
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      FutureBuilder<UpComingMovieModel>(
                        future: upcomingFuture,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return const Center(
                                child: CircularProgressIndicator());
                          } else if (snapshot.hasData &&
                              snapshot.data!.results.isNotEmpty) {
                            final movie = snapshot.data!.results[3];
                            return EveryoneWatchWidget(
                              imageUrl: movie.posterPath,
                              overview: movie.overview,
                              logourl: movie.backdropPath,
                              month: "Mar",
                              day: "29",
                            );
                          } else {
                            return const SizedBox.shrink();
                          }
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
