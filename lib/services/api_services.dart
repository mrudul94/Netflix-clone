import 'dart:convert';
import 'dart:developer';
import 'package:netflix/common/utils.dart';
import 'package:http/http.dart' as http;
import 'package:netflix/models/movie_details_model.dart';
import 'package:netflix/models/movie_recommendation.dart';
import 'package:netflix/models/now_playing_model.dart';
import 'package:netflix/models/popular_movie_model.dart';
import 'package:netflix/models/search_model.dart';
import 'package:netflix/models/top_rated_movies.dart';
import 'package:netflix/models/upcoming_movies.dart';

const baseUrl = 'https://api.themoviedb.org/3/';
var key = '?api_key=$apiKey';
late String endPoint;

class ApiServices {
  Future<PopularMovieModel> getPopularMovie() async {
    endPoint = 'movie/popular';
    final url = '$baseUrl$endPoint$key';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        log('Success: ${response.statusCode}');
        return PopularMovieModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed with status code: ${response.statusCode}. Response: ${response.body}');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  Future<TopRatedMovieModel> getTopRatedMovie() async {
    endPoint = 'movie/top_rated';
    final url = '$baseUrl$endPoint$key';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return TopRatedMovieModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed with status code: ${response.statusCode}. Response: ${response.body}');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  Future<UpComingMovieModel> getUpComingMovie() async {
    endPoint = 'movie/upcoming';
    final url = '$baseUrl$endPoint$key';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return UpComingMovieModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed with status code: ${response.statusCode}. Response: ${response.body}');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  Future<NowPlayingMovieModel> getNowPlayingMovie() async {
    endPoint = 'movie/now_playing';
    final url = '$baseUrl$endPoint$key';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return NowPlayingMovieModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed with status code: ${response.statusCode}. Response: ${response.body}');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  Future<SearchMovieModel> getSearchMovie(String searchText) async {
    endPoint =
        'search/movie?api_key=62acadcb26275ce3a0617c4864313c28&query=$searchText';
    final url = '$baseUrl$endPoint';

    try {
      final response = await http.get(Uri.parse(url), headers: {
        'Authorization':
            "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2MmFjYWRjYjI2Mjc1Y2UzYTA2MTdjNDg2NDMxM2MyOCIsIm5iZiI6MTcyOTkxNTgzOC4wMTY3NDYsInN1YiI6IjY3MTljNjFmMWVhMzM5MjgyOTdjZjBhMiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.xYXpUxctrioabMeJIRPKkyk1hr0fNx1pbeO2yypo3RQ"
      });
      if (response.statusCode == 200) {
        return SearchMovieModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed with status code: ${response.statusCode}. Response: ${response.body}');
      }
    } catch (e) {
      log('Error: $e');
      rethrow;
    }
  }

  Future<MovieDetailsModel> getMovieDetails(int movieId) async {
    String endPoint = 'movie/$movieId';
    final String url =
        '$baseUrl$endPoint$key'; // Ensure 'key' is properly defined

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return MovieDetailsModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed with status code: ${response.statusCode}. Response: ${response.body}');
      }
    } catch (e) {
      // Log any errors that occur
      log('Error: $e');
      rethrow; // Rethrow the error to be handled by the calling code
    }
  }

  Future<MovieRecommendationModel> getMovieRecommendation(int movieId) async {
    String endPoint = 'movie/$movieId/recommendations';
    final String url =
        '$baseUrl$endPoint$key'; // Ensure 'key' is properly defined

    try {
      final response = await http.get(Uri.parse(url));

      if (response.statusCode == 200) {
        return MovieRecommendationModel.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed with status code: ${response.statusCode}. Response: ${response.body}');
      }
    } catch (e) {
      // Log any errors that occur
      log('Error: $e');
      rethrow; // Rethrow the error to be handled by the calling code
    }
  }
}
