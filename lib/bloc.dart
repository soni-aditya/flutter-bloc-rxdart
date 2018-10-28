import 'package:flutter_bloc_pattern/api.dart';
import 'package:flutter_bloc_pattern/model.dart';
import 'package:rxdart/rxdart.dart';

class MovieBloc {
  final API api;

  //Streams originating from the bloc
  Stream<List<Movie>> _results = Stream.empty();
  Stream<String> _log = Stream.empty();

  //Streams comming into the bloc
  ReplaySubject<String> _query = ReplaySubject<String>();

  //Defining getter methods
  //These will allow us to fetch the streams from outside the bloc
  Stream<List<Movie>> get results => _results;

  Stream<String> get log => _log;

  Sink<String> get query => _query;

  MovieBloc(this.api) {
    _results = _query.distinct().asyncMap((query) {
      api.get(query);
    }).asBroadcastStream();

    _log = Observable(results)
        .withLatestFrom(_query.stream, (_, query) => 'Result for $query')
        .asBroadcastStream();
  }
  //We will only dispose Sinks
  //Not streams
  dispose() {
    _query.close();
  }
}
