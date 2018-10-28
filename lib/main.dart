import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/api.dart';
import 'package:flutter_bloc_pattern/bloc.dart';
import 'package:flutter_bloc_pattern/provider/movie_provider.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MovieProvider(
      movieBloc: MovieBloc(API()),
      child: new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Some Title'),
      ),
      body: Text('Some Text'),
    );
  }
}
