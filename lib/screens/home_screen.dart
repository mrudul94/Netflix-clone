import 'package:flutter/material.dart';
import 'package:netflix/models/now_playing_model.dart';
import 'package:netflix/models/popular_movie_model.dart';
import 'package:netflix/models/top_rated_movies.dart';
import 'package:netflix/models/upcoming_movies.dart';
import 'package:netflix/screens/download.dart';
import 'package:netflix/screens/search_screen.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/screens/categoreies.dart';
import 'package:netflix/widgets/popular_movie_card.dart';
import 'package:netflix/widgets/search_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<PopularMovieModel> popularFuture;
  late Future<TopRatedMovieModel> topratedFuture;
  late Future<UpComingMovieModel> upcomingFuture;
  late Future<NowPlayingMovieModel> nowplayingFuture;
  ApiServices apiServices = ApiServices();
  @override
  void initState() {
    super.initState();
    popularFuture = apiServices.getPopularMovie();
    topratedFuture = apiServices.getTopRatedMovie();
    upcomingFuture = apiServices.getUpComingMovie();
    nowplayingFuture = apiServices.getNowPlayingMovie();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          leading: Image.asset('assets/N.png'),
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
            InkWell(
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SearchScreen())),
              child: const Icon(Icons.search, color: Colors.white, size: 30),
            ),
            const SizedBox(
              width: 20,
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18, top: 10, right: 50),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white)),
                      child: const Center(child: Text('Tv Shows')),
                    ),
                    Container(
                      width: 70,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white)),
                      child: const Center(child: Text('Movies')),
                    ),
                    Container(
                      width: 100,
                      height: 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                  const Categoreies(),
                            ),
                          ),
                          child: const Center(
                              child: Row(
                            children: [
                              Text(
                                'Categories',
                                style: TextStyle(color: Colors.white),
                              ),
                              Icon(
                                Icons.arrow_drop_down_sharp,
                                color: Colors.white,
                              )
                            ],
                          )),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              PopularMovieCard(
                future: popularFuture,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchPageSection(
                    topratedFuture: topratedFuture,
                    upcomingFuture: upcomingFuture,
                    nowplayingFuture: nowplayingFuture,
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
