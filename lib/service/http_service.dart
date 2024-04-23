import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:movie/models/movie.dart';

class HttpService {
  final String apiKey = 'c92db2c39cfd9664d36b5ef574110dcb';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<List<Movie>?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("sukses");
      final jsonResponse = json.decode(result.body);
      final moviesMap = jsonResponse['results'];
      List<Movie> movies = moviesMap.map<Movie>((i) => Movie.fromJson(i)).toList();
      return movies;
    } else {
      print("fail");
      return null;
    }
  }
}
