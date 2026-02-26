// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$homeRemoteDatasourceHash() =>
    r'28f94da9576f765ae31a4aaa04175e76e31bc59e';

/// See also [homeRemoteDatasource].
@ProviderFor(homeRemoteDatasource)
final homeRemoteDatasourceProvider =
    AutoDisposeProvider<HomeRemoteDatasource>.internal(
      homeRemoteDatasource,
      name: r'homeRemoteDatasourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$homeRemoteDatasourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HomeRemoteDatasourceRef = AutoDisposeProviderRef<HomeRemoteDatasource>;
String _$homeRepositoryHash() => r'02f0079dba6b0425d2dd37351d173eaa15c232b3';

/// See also [homeRepository].
@ProviderFor(homeRepository)
final homeRepositoryProvider = AutoDisposeProvider<HomeRepository>.internal(
  homeRepository,
  name: r'homeRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$homeRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef HomeRepositoryRef = AutoDisposeProviderRef<HomeRepository>;
String _$getTrendingMoviesUseCaseHash() =>
    r'600782a80beb22360065573f0f59b279ff686146';

/// See also [getTrendingMoviesUseCase].
@ProviderFor(getTrendingMoviesUseCase)
final getTrendingMoviesUseCaseProvider =
    AutoDisposeProvider<GetTrendingMoviesUseCase>.internal(
      getTrendingMoviesUseCase,
      name: r'getTrendingMoviesUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getTrendingMoviesUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetTrendingMoviesUseCaseRef =
    AutoDisposeProviderRef<GetTrendingMoviesUseCase>;
String _$getPopularMoviesUseCaseHash() =>
    r'5c22c739887a78576d56b4971f1260a7955d5d44';

/// See also [getPopularMoviesUseCase].
@ProviderFor(getPopularMoviesUseCase)
final getPopularMoviesUseCaseProvider =
    AutoDisposeProvider<GetPopularMoviesUseCase>.internal(
      getPopularMoviesUseCase,
      name: r'getPopularMoviesUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getPopularMoviesUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetPopularMoviesUseCaseRef =
    AutoDisposeProviderRef<GetPopularMoviesUseCase>;
String _$trendingMoviesHash() => r'f6a0fa175e109e8997fdf2d14d9cd729252f363c';

/// See also [trendingMovies].
@ProviderFor(trendingMovies)
final trendingMoviesProvider = AutoDisposeFutureProvider<List<Movie>>.internal(
  trendingMovies,
  name: r'trendingMoviesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$trendingMoviesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef TrendingMoviesRef = AutoDisposeFutureProviderRef<List<Movie>>;
String _$popularMoviesNotifierHash() =>
    r'c8639d399633d6ba0744b52f76b80e088dcedbe7';

/// See also [PopularMoviesNotifier].
@ProviderFor(PopularMoviesNotifier)
final popularMoviesNotifierProvider =
    AutoDisposeAsyncNotifierProvider<
      PopularMoviesNotifier,
      List<Movie>
    >.internal(
      PopularMoviesNotifier.new,
      name: r'popularMoviesNotifierProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$popularMoviesNotifierHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$PopularMoviesNotifier = AutoDisposeAsyncNotifier<List<Movie>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
