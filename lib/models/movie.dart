class Movie {
  int id;
  String title;
  double voteAverage;
  String overview;
  String posterPath;

  Movie({required this.id, required this.title, required this.voteAverage, required this.overview, required this.posterPath});

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    return Movie(
      id: parsedJson['id'],
      title: parsedJson['title'],
      voteAverage: double.parse(parsedJson['vote_average'].toStringAsFixed(1)),
      overview: parsedJson['overview'],
      posterPath: parsedJson['poster_path'],
    );
  }
}
