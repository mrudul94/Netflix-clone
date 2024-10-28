import 'package:flutter/material.dart';

class ComingSoonWidget extends StatelessWidget {
  final String baseUrl = 'https://image.tmdb.org/t/p/w500';
  final String imageUrl;
  final String overView;
  final String logourl;
  final String month;
  final String day;

  const ComingSoonWidget({
    super.key,
    required this.imageUrl,
    required this.overView,
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
      child: SizedBox(
        child: Row(
          children: [
            Column(
              children: [
                const SizedBox(height: 10),
                Text(
                  month,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  day,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 40,
                      letterSpacing: 5),
                )
              ],
            ),
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.4,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        fullImageUrl,
                        fit: BoxFit.fill,
                        errorBuilder: (context, error, stackTrace) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Row(
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
                        children: [
                          Icon(
                            Icons.notifications_none_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                          SizedBox(height: 5),
                          Text(
                            "Remind me",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      const Column(
                        children: [
                          Icon(
                            Icons.info_outline_rounded,
                            size: 25,
                            color: Colors.white,
                          ),
                          SizedBox(width: 40),
                          SizedBox(height: 5),
                          Text(
                            "Info",
                            style: TextStyle(fontSize: 10),
                          ),
                        ],
                      ),
                      const SizedBox(width: 10),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Column(
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
                        overView,
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
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
