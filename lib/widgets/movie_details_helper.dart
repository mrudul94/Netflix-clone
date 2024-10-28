import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MovieDetailsWidget extends StatelessWidget {
  final String imageUrl;
  // ignore: prefer_typing_uninitialized_variables
  final movie;

  const MovieDetailsWidget({
    Key? key,
    required this.imageUrl,
    required this.movie,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage("$imageUrl${movie.posterPath}"),
              fit: BoxFit.fill,
            ),
          ),
          height: MediaQuery.of(context).size.height * 0.25,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            movie.originalTitle,
            style: TextStyle(
              fontFamily: GoogleFonts.ptSans().fontFamily,
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Text(
                "${movie.releaseDate.year}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),
              Text(
                "${movie.runtime}m",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(width: 20),
              Text(
                "${movie.status}",
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
