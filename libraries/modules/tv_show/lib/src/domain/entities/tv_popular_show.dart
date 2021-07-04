import 'movie.dart';

class TvPopularShow extends Movie {
  TvPopularShow(
    int id,
    String title,
    String overview,
    String releaseDate,
    List<int> genreIds,
    double voteAverage,
    double popularity,
    String posterPath,
    String backdropPath,
    String? tvName,
    String? tvRelease,
  ) : super(
          id,
          title,
          overview,
          releaseDate,
          genreIds,
          voteAverage,
          popularity,
          posterPath,
          backdropPath,
          tvName,
          tvRelease,
        );
}
