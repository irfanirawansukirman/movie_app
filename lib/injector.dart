import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:mvvm_movie_app/data/repository/movie/movie_remote_source_impl.dart';
import 'package:mvvm_movie_app/data/repository/movie/movie_repository_domain_impl.dart';
import 'package:mvvm_movie_app/domain/repository/movie_repository.dart';
import 'package:mvvm_movie_app/domain/usecase/movie_usecase.dart';
import 'package:mvvm_movie_app/presentation/home/now_playing/now_playing_cubit.dart';
import 'package:mvvm_movie_app/presentation/home/popular/popular_cubit.dart';
import 'package:mvvm_movie_app/presentation/home/top_rated/top_rated_cubit.dart';
import 'package:mvvm_movie_app/presentation/home/up_coming/up_coming_cubit.dart';
import 'package:mvvm_movie_app/presentation/movie_detail/movie_detail_cubit.dart';

final locator = GetIt.instance;

void initDependencies() {
  // external
  locator.registerFactory(() => http.Client());

  // repository impl source
  locator.registerFactory(() => MovieRemoteSourceImpl(locator()));

  // repository impl domain
  locator.registerFactory<MovieRepository>(
    () => MovieRepositoryDomainImpl(
      locator(),
    ),
  );

  // usecase
  locator.registerFactory(() => MovieUseCase(locator()));

  // presentation - cubit state
  locator.registerFactory(() => NowPlayingCubit(locator()));
  locator.registerFactory(() => PopularMovieCubit(locator()));
  locator.registerFactory(() => TopRatedCubit(locator()));
  locator.registerFactory(() => UpComingCubit(locator()));
  locator.registerFactory(() => MovieDetailCubit(locator()));
}
