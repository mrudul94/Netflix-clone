
import 'dart:convert';
import 'dart:developer';
import 'package:netflix/common/utils.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/models/popular_movie_model.dart';

const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$apiKey';
late String endPoint;
class ApiServices {
  Future<PopularMovieModel> getPopularMovie() async {
    endPoint = 'movie/popular';
    final url = '$baseUrl$endPoint$key';  // Adjusted URL
    
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log('Success: ${response.statusCode}');
        return PopularMovieModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception('Failed with status code: ${response.statusCode}. Response: ${response.body}');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }
}
