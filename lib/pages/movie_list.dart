import 'package:flutter/material.dart';
import 'package:movie/service/http_service.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  String result = "";
  late HttpService service;

  @override
  void initState() {
    super.initState();
    service = HttpService();
    _fetchMovies();
  }

  _fetchMovies() async {
    final response = await service.getPopularMovies();
    if (response != null) {
      setState(() {
        result = response;
      });
    } else {
      // Handle error
      print('Failed to fetch movies');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Popular Movies"),
      ),
      body: Container(
        child: Text(result),
      ),
    );
  }
}
