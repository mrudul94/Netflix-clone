import 'package:flutter/material.dart';

class EveryoneWatchWidget extends StatelessWidget {
  final String baseUrl = 'https://image.tmdb.org/t/p/w500';
  final String imageUrl;
  final String overview;
  final String logourl;
  final String month;
  final String day;

  const EveryoneWatchWidget({
    super.key,
    required this.imageUrl,
    required this.overview,
    required this.logourl,
    required this.month,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    final fullImageUrl =
        imageUrl.startsWith('http') ? imageUrl : '$baseUrl$imageUrl';
    final fullLogoUrl =
        logourl.startsWith('http') ? logourl : '$baseUrl$logourl';

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width * 1,
              child: Image.network(
                fullImageUrl,
                fit: BoxFit.fill,
              )),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                        height: 100,
                        width: 120,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            fullLogoUrl,
                            fit: BoxFit.fill,
                            alignment: Alignment.centerLeft,
                            errorBuilder: (context, error, stackTrace) =>
                                const Icon(Icons.error),
                          ),
                        ),
                      ),
              const Spacer(),
              const Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    Icons.share,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Share",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(width: 20),
              const Column(
                children: [
                  Icon(
                    Icons.add,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "My List",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(width: 10),
              const Column(
                children: [
                  Icon(
                    Icons.play_arrow,
                    size: 25,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  Text(
                    "Play",
                    style: TextStyle(fontSize: 10),
                  ),
                ],
              ),
              const SizedBox(width: 20),
            ],
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Coming on $month $day",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 17,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  overview,
                  maxLines: 4,
                  textAlign: TextAlign.left,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
