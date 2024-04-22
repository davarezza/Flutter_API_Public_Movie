import 'dart:io';
import 'package:http/http.dart' as http;

class HttpService {
  final String apiKey = 'c92db2c39cfd9664d36b5ef574110dcb';
  final String baseUrl = 'https://api.themoviedb.org/3/movie/popular?api_key=';

  Future<String?> getPopularMovies() async {
    final String uri = baseUrl + apiKey;

    http.Response result = await http.get(Uri.parse(uri));
    if (result.statusCode == HttpStatus.ok) {
      print("sukses");
      String response = result.body;
      return response;
    } else {
      print("fail");
      return null;
    }
  }
}
