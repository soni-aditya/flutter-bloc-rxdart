class Movie {
  final String movieTitle;
  final String posterPath;
  final String overview;

  Movie(this.movieTitle, this.posterPath, this.overview);

  Movie.fromJson(Map json)
      : movieTitle = json['title'],
        posterPath = json['poster_path'],
        overview = json['overview'];
}
