import 'dart:convert';

import 'package:netflix_clone/core/constants.dart';
import 'package:netflix_clone/models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  static const trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apikey}';
  static const top10movies =
      'https://api.themoviedb.org/3/tv/top_rated?api_key=${Constants.apikey}';
  static const tenseDrama =
      'https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apikey}';
  static const southIndianCinemasUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apikey}';
  static const searchidleUrl =
      'https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apikey}';
      
  //getTrandingmovies
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(trendingUrl));
    if (response.statusCode == 200) {
      // print('sucess');
      final decodedData = json.decode(response.body)['results'] as List;
      // print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something wrong happen');
    }
  }

  //get top 10 movies
  Future<List<Movie>> getTop10Movies() async {
    final response = await http.get(Uri.parse(top10movies));
    if (response.statusCode == 200) {
      //print('succses');
      final decodeData = json.decode(response.body)['results'] as List;
      //print(decodeData);
      return decodeData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('somthing wrong in top10');
    }
  }

  //tense drama
  Future<List<Movie>> getTenseDrama() async {
    final response = await http.get(Uri.parse(tenseDrama));
    if (response.statusCode == 200) {
      // print('succses');
      final decodeData = json.decode(response.body)['results'] as List;
      //  print(decodeData);
      return decodeData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('somthing wrong in tenseDrama');
    }
  }

  //south indian cinemas
  Future<List<Movie>> getSouthIndianCinemas() async {
    final response = await http.get(Uri.parse(southIndianCinemasUrl));
    if (response.statusCode == 200) {
      // print('succses');
      final decodeData = json.decode(response.body)['results'] as List;
      // print(decodeData);
      return decodeData.map((e) => Movie.fromJson(e)).toList();
    } else {
      throw Exception('somthing wrong in top10');
    }
  }

  //get search idle
  Future<List<Movie>> getSearchPageIdle() async {
    final response = await http.get(Uri.parse(searchidleUrl));
    if (response.statusCode == 200) {
      //print('sucess');
      final decodedData = json.decode(response.body)['results'] as List;
      // print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something wrong happen');
    }
  }

  //get search result
  Future<List<Movie>> getSearchResult(String movie) async {
    String searchResult =
        'https://api.themoviedb.org/3/search/movie?api_key=${Constants.apikey}&query=$movie';
    final response = await http.get(Uri.parse(searchResult));
    if (response.statusCode == 200) {
      // print('sucess');
      final decodedData = json.decode(response.body)['results'] as List;
      // print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('something wrong happen');
    }

    //final response=await http.post(uri.parse(),headers: {"access token":áccesstoken,"x_api_key":apikey},body: jsonEncode({"name":"salu"}))
  }
}
