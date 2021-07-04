import '../entities/crew.dart';
import '../entities/movie.dart';
import '../entities/on_the_air.dart';
import '../entities/trailer.dart';
import '../entities/tv_popular_show.dart';

abstract class ITvShowRepository {
  Future<List<Movie>> getTvAiringToday();
  Future<List<TvPopularShow>> getTvPopularShow();
  Future<List<OnTheAir>> getOnTheAir();
  Future<List<Crew>> getTvShowCrewById(int movieId);
  Future<List<Trailer>> getTvShowTrailerById(int movieId);
}
