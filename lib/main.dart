import 'package:flutter/material.dart';
import 'package:flutter_bloc_pattern/constants.dart';
import 'package:http/http.dart' as http;

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  Future<String> getFuture() async {
    String _url =
        "https://api.themoviedb.org/3/search/company?api_key=${Constants.API_KEY}&query={1}";
    await http.Client().get(Uri.parse(_url.replaceAll('{1}', 'abc')));
    return 'This is From Future';
  }

  @override
  Widget build(BuildContext context) {
    getFuture().then((response) {
      print(response.toString());
    });
    return Scaffold(
      appBar: AppBar(
        title: Text('Some Title'),
      ),
      body: Text('Some Text'),
    );
  }
}
