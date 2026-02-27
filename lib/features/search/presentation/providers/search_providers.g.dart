// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$searchRemoteDatasourceHash() =>
    r'9cca3b9c24b7207ed71986b8466648d41ac2dfde';

/// See also [searchRemoteDatasource].
@ProviderFor(searchRemoteDatasource)
final searchRemoteDatasourceProvider =
    AutoDisposeProvider<SearchRemoteDatasource>.internal(
      searchRemoteDatasource,
      name: r'searchRemoteDatasourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchRemoteDatasourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SearchRemoteDatasourceRef =
    AutoDisposeProviderRef<SearchRemoteDatasource>;
String _$searchRepositoryHash() => r'19cfc594de57c1292dd5141b14e53520574245b2';

/// See also [searchRepository].
@ProviderFor(searchRepository)
final searchRepositoryProvider = AutoDisposeProvider<SearchRepository>.internal(
  searchRepository,
  name: r'searchRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SearchRepositoryRef = AutoDisposeProviderRef<SearchRepository>;
String _$searchMoviesUseCaseHash() =>
    r'935e21cc4309ca14696e53b7365879e0f5bb8ee8';

/// See also [searchMoviesUseCase].
@ProviderFor(searchMoviesUseCase)
final searchMoviesUseCaseProvider =
    AutoDisposeProvider<SearchMoviesUseCase>.internal(
      searchMoviesUseCase,
      name: r'searchMoviesUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchMoviesUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SearchMoviesUseCaseRef = AutoDisposeProviderRef<SearchMoviesUseCase>;
String _$searchResultsHash() => r'81d429bbb9240cf187f55fec2eefc5dd70b78d34';

/// See also [searchResults].
@ProviderFor(searchResults)
final searchResultsProvider = AutoDisposeFutureProvider<List<Movie>>.internal(
  searchResults,
  name: r'searchResultsProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$searchResultsHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef SearchResultsRef = AutoDisposeFutureProviderRef<List<Movie>>;
String _$searchQueryHash() => r'286abcff51dc844febe02639bb2e883ccab22cfd';

/// See also [SearchQuery].
@ProviderFor(SearchQuery)
final searchQueryProvider =
    AutoDisposeNotifierProvider<SearchQuery, String>.internal(
      SearchQuery.new,
      name: r'searchQueryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$searchQueryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$SearchQuery = AutoDisposeNotifier<String>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
