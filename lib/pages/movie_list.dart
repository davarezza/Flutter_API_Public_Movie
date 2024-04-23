import 'package:flutter/material.dart';
import 'package:movie/pages/movie_detail.dart';
import 'package:movie/service/http_service.dart';
import 'package:movie/models/movie.dart';

class MovieList extends StatefulWidget {
  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  int? moviesCount;
  List<Movie>? movies;
  HttpService service = HttpService();

  @override
  void initState() {
    super.initState();
    initialize();
  }

  Future<void> initialize() async {
    movies = await service.getPopularMovies();
    setState(() {
      moviesCount = movies?.length ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Popular Movies",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView.builder(
        itemCount: moviesCount ?? 0,
        itemBuilder: (context, int position) {
          String path = movies?[position].posterPath != null && movies![position].posterPath!.isNotEmpty
              ? 'https://image.tmdb.org/t/p/w500/' + movies![position].posterPath!
              : 'https://images.freeimages.com/images/large-previews/5eb/movie-clapboard-1184339.jpg';

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    path,
                    height: 200,
                    width: 125,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        movies?[position].title ?? '',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 14),
                      Text(
                        'Description',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 4),
                      Text(
                        movies?[position].overview ?? '',
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      SizedBox(height: 8),
                      Text(
                        '⭐ ${movies?[position].voteAverage.toString() ?? ''}/10',
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 8),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => MovieDetail(movies![position]),
                            ),
                          );
                        },
                        child: Text('Details'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
