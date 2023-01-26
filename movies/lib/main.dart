import 'package:flutter/material.dart';
import 'package:movies/providers/movies_provider.dart';
import 'package:provider/provider.dart';

import 'screens/screens.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  const AppState({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => MoviesProvider(),
          lazy: false,
        ),
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Movies",
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: {
        'home': (_) => HomeScreen(),
        'details': (_) => DetailsScreen(),
      },
      theme: ThemeData.light().copyWith(
          // ignore: prefer_const_constructors
          appBarTheme: AppBarTheme(
        color: Colors.indigo,
      )),
    );
  }
}
