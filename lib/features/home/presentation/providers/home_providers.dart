import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_clean_base/core/errors/failures.dart';
import 'package:riverpod_clean_base/core/network/dio_client.dart';
import 'package:riverpod_clean_base/features/home/data/datasources/home_remote_datasource.dart';
import 'package:riverpod_clean_base/features/home/data/repositories/home_repository_impl.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';
import 'package:riverpod_clean_base/features/home/domain/repositories/home_repository.dart';
import 'package:riverpod_clean_base/features/home/domain/usecases/get_popular_movies_usecase.dart';
import 'package:riverpod_clean_base/features/home/domain/usecases/get_trending_movies_usecase.dart';
import 'package:riverpod_clean_base/shared/domain/entities/no_params.dart';

part 'home_providers.g.dart';

@riverpod
HomeRemoteDatasource homeRemoteDatasource(HomeRemoteDatasourceRef ref) {
  return HomeRemoteDatasource(ref.watch(dioProvider));
}

@riverpod
HomeRepository homeRepository(HomeRepositoryRef ref) {
  return HomeRepositoryImpl(ref.watch(homeRemoteDatasourceProvider));
}

@riverpod
GetTrendingMoviesUseCase getTrendingMoviesUseCase(
  GetTrendingMoviesUseCaseRef ref,
) {
  return GetTrendingMoviesUseCase(ref.watch(homeRepositoryProvider));
}

@riverpod
GetPopularMoviesUseCase getPopularMoviesUseCase(
  GetPopularMoviesUseCaseRef ref,
) {
  return GetPopularMoviesUseCase(ref.watch(homeRepositoryProvider));
}

@riverpod
Future<List<Movie>> trendingMovies(TrendingMoviesRef ref) async {
  final useCase = ref.watch(getTrendingMoviesUseCaseProvider);
  final result = await useCase(const NoParams());
  return result.fold(
    (failure) => throw failure,
    (movies) => movies,
  );
}

@riverpod
class PopularMoviesNotifier extends _$PopularMoviesNotifier {
  int _page = 1;
  bool _hasMore = true;

  @override
  Future<List<Movie>> build() async {
    _page = 1;
    _hasMore = true;
    return _fetchPage(1);
  }

  Future<List<Movie>> _fetchPage(int page) async {
    final useCase = ref.read(getPopularMoviesUseCaseProvider);
    final result = await useCase(page);
    return result.fold(
      (failure) => throw failure,
      (movies) {
        if (movies.isEmpty) _hasMore = false;
        return movies;
      },
    );
  }

  Future<void> fetchNextPage() async {
    if (!_hasMore || state.isLoading) return;
    _page++;
    state = const AsyncLoading();
    try {
      final newMovies = await _fetchPage(_page);
      final current = state.valueOrNull ?? [];
      state = AsyncData([...current, ...newMovies]);
    } on Failure catch (e, st) {
      _page--;
      state = AsyncError(e, st);
    }
  }

  bool get hasMore => _hasMore;
}
