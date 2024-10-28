import 'package:flutter/material.dart';
import 'package:netflix/common/utils.dart';
import 'package:netflix/screens/movie_details_page.dart';
import 'package:netflix/widgets/text_helper.dart';

Widget buildSearch(
    {required String text,
    double paddingLeft = 10.0,
    double paddingTop = 10.0,
    required dynamic searchMovieModel}) {
  return Padding(
      padding: const EdgeInsets.only(left: 0, top: 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          buildText(
            text: "Top Results",
          ),
          SizedBox(
            height: 170,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: searchMovieModel!.results.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 150,
                        child: InkWell(
                          onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MovieDetailsPage(
                                        movieId:
                                            searchMovieModel!.results[index].id,
                                      ))),
                          child: Card(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(5),
                              child: Image.network(
                                '$imageUrl${searchMovieModel!.results[index].posterPath}',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ));
}
