import 'dart:convert';

import 'package:flutter_bloc_pattern/constants.dart';
import 'package:flutter_bloc_pattern/model.dart';
import 'package:http/http.dart' as http;

class API {
  final http.Client _client = http.Client();
  static String _url =
      "https://api.themoviedb.org/3/search/company?api_key=${Constants.API_KEY}&query={1}";

  Future<List<Movie>> get(String query) async {
    List<Movie> movieList = [];
    await _client
        .get(
          Uri.parse(
            _url.replaceFirst('{1}', query.toString()),
          ),
        )
        .then((response) => response.body)
        .then(json.decode)
        .then((json) => json['results'])
        .then((movies) {
      movies.forEach((movie) {
        movieList.add(Movie.fromJson(movie));
      });
    });
    return movieList;
  }
}
