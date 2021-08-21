import 'package:booking/booking.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'domain/use_cases/get_movie_crew_by_id.dart';
import 'domain/use_cases/get_movie_now_playing.dart';
import 'domain/use_cases/get_movie_popular.dart';
import 'domain/use_cases/get_movie_trailer_by_id.dart';
import 'domain/use_cases/get_movie_up_coming.dart';
import 'domain/use_cases/get_tv_show_crew_by_id.dart';
import 'domain/use_cases/get_tv_show_trailer_by_id.dart';
import 'external/data_sources/movie_data_source_impl.dart';
import 'infra/repositories/movies_repository_impl.dart';
import 'movie_page.dart';
import 'presenter/pages/detail/detail_page.dart';
import 'presenter/pages/now_playing/now_playing_page.dart';
import 'presenter/pages/now_playing/now_playing_store.dart';
import 'presenter/pages/popular/movie_popular_page.dart';
import 'presenter/pages/popular/movie_popular_store.dart';
import 'presenter/pages/up_coming/up_coming_page.dart';
import 'presenter/pages/up_coming/up_coming_store.dart';
import 'presenter/widgets/crew/crew_store.dart';
import 'presenter/widgets/movie_banner/movie_banner_store.dart';
import 'presenter/widgets/popular/popular_store.dart';
import 'presenter/widgets/trailer/trailer_store.dart';
import 'presenter/widgets/up_coming/up_coming_widget_store.dart';

class MovieModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => MoviePlayingStore(i())),
    Bind.lazySingleton((i) => MoviePopularStore(i())),
    Bind.lazySingleton((i) => UpComingWidgetStore(i())),
    Bind.lazySingleton((i) => MoviePlayingStore(i())),
    Bind.lazySingleton((i) => UpComingWidgetStore(i())),
    Bind.lazySingleton((i) => UpComingStore(i())),
    Bind.lazySingleton((i) => PopularStore(i())),
    Bind.lazySingleton((i) => MovieBannerStore(i())),
    Bind.lazySingleton((i) => CrewStore(i(), i())),
    Bind.lazySingleton((i) => TrailerStore(i(), i())),

    //Datasources
    Bind.lazySingleton((i) => MovieDataSourceImpl(i(), i())),
    //repositories
    Bind.lazySingleton((i) => MoviesRepositoryImpl(i())),
    //useCases
    Bind.lazySingleton((i) => GetMovieNowPlaying(i())),
    Bind.lazySingleton((i) => GetMoviePopular(i())),
    Bind.lazySingleton((i) => GetMovieUpComming(i())),
    Bind.lazySingleton((i) => GetMovieTrailerById(i())),
    Bind.lazySingleton((i) => GetTvShowTrailer(i())),
    Bind.lazySingleton((i) => GetTvShowCrewById(i())),
    Bind.lazySingleton((i) => GetMovieCrewById(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => MoviePage()),
    ChildRoute('/now_playing', child: (_, __) => NowPlayingPage()),
    ChildRoute('/movie_popular', child: (_, __) => MoviePopularPage()),
    ChildRoute('/up_coming', child: (_, __) => UpComingPage()),
    ChildRoute('/detail_movies', child: (_, args) => DetailPage(arguments: args.data)),
    ModuleRoute('/booking', module: BookingModule()),
  ];
}
