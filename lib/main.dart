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
    final movieProvider = MovieProvider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Some Title'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10.0),
            child: TextField(
              onChanged: movieProvider.query.add,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Search for a movie',
              ),
            ),
          ),
          StreamBuilder(
            stream: movieProvider.log,
            builder: (context, snapshot) {
              return Container(
                child: Text(snapshot?.data ?? ''),
              );
            },
          ),
          Flexible(
            child: StreamBuilder(
              stream: movieProvider.results,
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        child: Image.network('https://image.tmdb.org/t/p/w92' +
                            snapshot.data[index].posterPath),
                      ),
                      title: Text(snapshot.data[index].title),
                      subtitle: Text(snapshot.data[index].overview),
                    );
                  },
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
