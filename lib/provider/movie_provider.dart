import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/api.dart';
import 'package:flutter_bloc_pattern/bloc.dart';

class MovieProvider extends InheritedWidget {
  final MovieBloc movieBloc;

  MovieProvider({Key key, MovieBloc movieBloc, Widget child})
      : this.movieBloc = movieBloc ?? MovieBloc(API()),
        super(child: child, key: key);

  static MovieBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(MovieProvider) as MovieProvider)
          .movieBloc;

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    return true;
  }
}
