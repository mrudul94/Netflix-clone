// ignore_for_file: library_private_types_in_public_api
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/models/popular_movie_model.dart';
import 'package:netflix/screens/movie_details_page.dart';

class PopularMovieCard extends StatefulWidget {
  final Future<PopularMovieModel> future;

  const PopularMovieCard({super.key, required this.future});

  @override
  _PopularMovieCardState createState() => _PopularMovieCardState();
}

class _PopularMovieCardState extends State<PopularMovieCard> {
  bool isPressed = false; 
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: widget.future,
        builder: (context, snapshot) {
          var data = snapshot.data?.results;
          if (!snapshot.hasData) {
            return Column(children: [
              Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: SizedBox(
                      height: 450,
                      child: Stack(children: [
                        Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Color.fromARGB(255, 36, 36, 36),
                              width: 0.5,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter:
                                  ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                              child: Container(
                                height: double.infinity,
                                color: Colors.black.withOpacity(0.1),
                              ),
                            ),
                          ),
                        )
                      ])))
            ]);
          }
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: SizedBox(
                  height: 450,
                  child: Stack(
                    children: [
                      InkWell(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MovieDetailsPage(
                                      movieId: data[0].id,
                                    ))),
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: const BorderSide(
                              color: Colors.white,
                              width: 0.5,
                            ),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                  '$imageUrl${data![0].posterPath}')),
                        ),
                      ),
                      Positioned(
                          bottom: 100,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              data[0].title,
                              style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  fontSize: 40,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: GoogleFonts.ptSans().fontFamily),
                            ),
                          )),
                      Positioned(
                        bottom: 50,
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      minimumSize: const Size(120, 35)),
                                  child: const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.play_arrow,
                                        color: Colors.black,
                                        size: 30,
                                      ),
                                      Text('Play',
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black))
                                    ],
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 25),
                              child: ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isPressed =
                                          !isPressed; // Toggle the state
                                    });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      minimumSize: const Size(120, 35),
                                      backgroundColor: const Color.fromARGB(
                                          108, 255, 255, 255)),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(
                                        isPressed
                                            ? Icons.check
                                            : Icons.add, // Toggle between icons
                                        color: Colors.white,
                                        size: 30,
                                      ),
                                      const Text(
                                          'My List', // Toggle text as well
                                          style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white))
                                    ],
                                  )),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          );
        });
  }
}
