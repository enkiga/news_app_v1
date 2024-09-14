import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/model.dart';

const apiKey = "7eed901daca4dbf18cf01f5f4c31ab72";

class APIService {
  // For now showing movies
  final nowShowingApi =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";

  Future<List<Movie>> getNowShowing() async {
    Uri url = Uri.parse(nowShowingApi);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }

  // For upcoming movies
  final upcoming =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";

  Future<List<Movie>> getUpcoming() async {
    Uri url = Uri.parse(upcoming);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }


//   For Popular movies
  final popular = "https://api.themoviedb.org/3/movie/popular?api_key=$apiKey";

  Future<List<Movie>> getPopular() async {
    Uri url = Uri.parse(popular);
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['results'];
      List<Movie> movies = data.map((movie) => Movie.fromMap(movie)).toList();
      return movies;
    } else {
      throw Exception("Failed to load data");
    }
  }
}
