import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:movies/models/now-playing_response.dart';
import 'package:movies/models/popular_response.dart';

import '../models/movie.dart';

class MoviesProvider extends ChangeNotifier {
  final _apiKey = 'd1437d968391d18e6ad43e5681bf8ee8';
  final _baseUrl = 'api.themoviedb.org';
  final _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  int _popularPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    final Map<String, dynamic> decodedData = json.decode(jsonData);

    //se le asigna a la lista los resultados de tipo Movie
    onDisplayMovies = nowPlayingResponse.results;

    //se avisa de los cambios a todos los listeners
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    final popularResponse = PopularResponse.fromJson(jsonData);

    final Map<String, dynamic> decodedData = json.decode(jsonData);

    //se le asigna a la lista los resultados de tipo Movie
    popularMovies = [...popularMovies, ...popularResponse.results];
    print(popularResponse.results);
    //se avisa de los cambios a todos los listeners
    notifyListeners();
  }

  //si no llega valor de page es igual a 1
  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    var url = Uri.https(
      _baseUrl,
      endpoint,
      {
        'api_key': _apiKey,
        'language': _language,
        'page': '$page',
      },
    );

    final response = await http.get(url);
    return response.body;
  }
}
