import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier {
  MoviesProvider() {
    print('Provider Inicializando');
  }

  getOnDisplayMovies() async {
    print('getPlayingMovies');
  }
}
