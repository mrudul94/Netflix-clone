import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/models/now_playing_model.dart';
import 'package:netflix/models/search_model.dart';
import 'package:netflix/models/top_rated_movies.dart';
import 'package:netflix/models/upcoming_movies.dart';
import 'package:netflix/screens/download.dart';
import 'package:netflix/services/api_services.dart';
import 'package:netflix/widgets/search_page.dart';
import 'package:netflix/widgets/search_result_card.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  TextEditingController searchController = TextEditingController();
  late Future<TopRatedMovieModel> topratedFuture;
  late Future<UpComingMovieModel> upcomingFuture;
  late Future<NowPlayingMovieModel> nowplayingFuture;
  ApiServices apiServices = ApiServices();
  SearchMovieModel? searchMovieModel;
  @override
  void initState() {
    super.initState();
    topratedFuture = apiServices.getTopRatedMovie();
    upcomingFuture = apiServices.getUpComingMovie();
    nowplayingFuture = apiServices.getNowPlayingMovie();
  }

  Timer? _debounce;

  void search(String query) {
    apiServices.getSearchMovie(query).then((result) {
      setState(() {
        searchMovieModel = result;
      });
    });
  }

  void onSearchChanged(String query) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      if (query.isNotEmpty) {
        search(query);
      }
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    _debounce?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
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
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CupertinoSearchTextField(
              padding: const EdgeInsets.only(left: 20),
              controller: searchController,
              prefixIcon: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Icon(
                  Icons.search,
                  color: Color.fromARGB(255, 168, 167, 167),
                  size: 30,
                ),
              ),
              placeholder: 'Search shows, movies...',
              suffixIcon: const Icon(
                Icons.cancel_outlined,
                color: Color.fromARGB(255, 168, 167, 167),
                size: 30,
              ),
              style: const TextStyle(color: Colors.white),
              backgroundColor: const Color.fromARGB(255, 41, 41, 41),
              onChanged: onSearchChanged,
            ),
            if (searchMovieModel == null)
              SearchPageSection(
                topratedFuture: topratedFuture,
                upcomingFuture: upcomingFuture,
                nowplayingFuture: nowplayingFuture,
              )
            else
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  buildSearch(
                      text: 'Top Search', searchMovieModel: searchMovieModel),
                  SearchPageSection(
                    topratedFuture: topratedFuture,
                    upcomingFuture: upcomingFuture,
                    nowplayingFuture: nowplayingFuture,
                  ),
                ],
              )
          ],
        ),
      ),
    ));
  }
}
