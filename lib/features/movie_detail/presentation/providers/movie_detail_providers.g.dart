// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_detail_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$movieDetailRemoteDatasourceHash() =>
    r'09545be01a7836643e18ff69163f0f03e01de884';

/// See also [movieDetailRemoteDatasource].
@ProviderFor(movieDetailRemoteDatasource)
final movieDetailRemoteDatasourceProvider =
    AutoDisposeProvider<MovieDetailRemoteDatasource>.internal(
      movieDetailRemoteDatasource,
      name: r'movieDetailRemoteDatasourceProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$movieDetailRemoteDatasourceHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MovieDetailRemoteDatasourceRef =
    AutoDisposeProviderRef<MovieDetailRemoteDatasource>;
String _$movieDetailRepositoryHash() =>
    r'5c49959fda77c0cc16f6f42af5081f9dd815bbdc';

/// See also [movieDetailRepository].
@ProviderFor(movieDetailRepository)
final movieDetailRepositoryProvider =
    AutoDisposeProvider<MovieDetailRepository>.internal(
      movieDetailRepository,
      name: r'movieDetailRepositoryProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$movieDetailRepositoryHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef MovieDetailRepositoryRef =
    AutoDisposeProviderRef<MovieDetailRepository>;
String _$getMovieDetailUseCaseHash() =>
    r'a5d2b1a70acb21672a424dca28ea307ea50f05b8';

/// See also [getMovieDetailUseCase].
@ProviderFor(getMovieDetailUseCase)
final getMovieDetailUseCaseProvider =
    AutoDisposeProvider<GetMovieDetailUseCase>.internal(
      getMovieDetailUseCase,
      name: r'getMovieDetailUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getMovieDetailUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetMovieDetailUseCaseRef =
    AutoDisposeProviderRef<GetMovieDetailUseCase>;
String _$getMovieCreditsUseCaseHash() =>
    r'6470743309dba6d4711527ea87266c4356b5d2c2';

/// See also [getMovieCreditsUseCase].
@ProviderFor(getMovieCreditsUseCase)
final getMovieCreditsUseCaseProvider =
    AutoDisposeProvider<GetMovieCreditsUseCase>.internal(
      getMovieCreditsUseCase,
      name: r'getMovieCreditsUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getMovieCreditsUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetMovieCreditsUseCaseRef =
    AutoDisposeProviderRef<GetMovieCreditsUseCase>;
String _$getSimilarMoviesUseCaseHash() =>
    r'd9a807f3913ab28fe487fb0a14eed6d88779cdca';

/// See also [getSimilarMoviesUseCase].
@ProviderFor(getSimilarMoviesUseCase)
final getSimilarMoviesUseCaseProvider =
    AutoDisposeProvider<GetSimilarMoviesUseCase>.internal(
      getSimilarMoviesUseCase,
      name: r'getSimilarMoviesUseCaseProvider',
      debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
          ? null
          : _$getSimilarMoviesUseCaseHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetSimilarMoviesUseCaseRef =
    AutoDisposeProviderRef<GetSimilarMoviesUseCase>;
String _$movieDetailHash() => r'cbc0b234e92050bd24f77f3bd1d23e3ed33adf32';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [movieDetail].
@ProviderFor(movieDetail)
const movieDetailProvider = MovieDetailFamily();

/// See also [movieDetail].
class MovieDetailFamily extends Family<AsyncValue<MovieDetail>> {
  /// See also [movieDetail].
  const MovieDetailFamily();

  /// See also [movieDetail].
  MovieDetailProvider call(int movieId) {
    return MovieDetailProvider(movieId);
  }

  @override
  MovieDetailProvider getProviderOverride(
    covariant MovieDetailProvider provider,
  ) {
    return call(provider.movieId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieDetailProvider';
}

/// See also [movieDetail].
class MovieDetailProvider extends AutoDisposeFutureProvider<MovieDetail> {
  /// See also [movieDetail].
  MovieDetailProvider(int movieId)
    : this._internal(
        (ref) => movieDetail(ref as MovieDetailRef, movieId),
        from: movieDetailProvider,
        name: r'movieDetailProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$movieDetailHash,
        dependencies: MovieDetailFamily._dependencies,
        allTransitiveDependencies: MovieDetailFamily._allTransitiveDependencies,
        movieId: movieId,
      );

  MovieDetailProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<MovieDetail> Function(MovieDetailRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieDetailProvider._internal(
        (ref) => create(ref as MovieDetailRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<MovieDetail> createElement() {
    return _MovieDetailProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieDetailProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MovieDetailRef on AutoDisposeFutureProviderRef<MovieDetail> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _MovieDetailProviderElement
    extends AutoDisposeFutureProviderElement<MovieDetail>
    with MovieDetailRef {
  _MovieDetailProviderElement(super.provider);

  @override
  int get movieId => (origin as MovieDetailProvider).movieId;
}

String _$movieCreditsHash() => r'09b5f0beb3dd1498f1a541e10fdf295ef6e879bf';

/// See also [movieCredits].
@ProviderFor(movieCredits)
const movieCreditsProvider = MovieCreditsFamily();

/// See also [movieCredits].
class MovieCreditsFamily extends Family<AsyncValue<List<CastMember>>> {
  /// See also [movieCredits].
  const MovieCreditsFamily();

  /// See also [movieCredits].
  MovieCreditsProvider call(int movieId) {
    return MovieCreditsProvider(movieId);
  }

  @override
  MovieCreditsProvider getProviderOverride(
    covariant MovieCreditsProvider provider,
  ) {
    return call(provider.movieId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'movieCreditsProvider';
}

/// See also [movieCredits].
class MovieCreditsProvider extends AutoDisposeFutureProvider<List<CastMember>> {
  /// See also [movieCredits].
  MovieCreditsProvider(int movieId)
    : this._internal(
        (ref) => movieCredits(ref as MovieCreditsRef, movieId),
        from: movieCreditsProvider,
        name: r'movieCreditsProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$movieCreditsHash,
        dependencies: MovieCreditsFamily._dependencies,
        allTransitiveDependencies:
            MovieCreditsFamily._allTransitiveDependencies,
        movieId: movieId,
      );

  MovieCreditsProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<List<CastMember>> Function(MovieCreditsRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MovieCreditsProvider._internal(
        (ref) => create(ref as MovieCreditsRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<CastMember>> createElement() {
    return _MovieCreditsProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MovieCreditsProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin MovieCreditsRef on AutoDisposeFutureProviderRef<List<CastMember>> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _MovieCreditsProviderElement
    extends AutoDisposeFutureProviderElement<List<CastMember>>
    with MovieCreditsRef {
  _MovieCreditsProviderElement(super.provider);

  @override
  int get movieId => (origin as MovieCreditsProvider).movieId;
}

String _$similarMoviesHash() => r'8c260282205299d7aa9075a4734f4b33a90db0bb';

/// See also [similarMovies].
@ProviderFor(similarMovies)
const similarMoviesProvider = SimilarMoviesFamily();

/// See also [similarMovies].
class SimilarMoviesFamily extends Family<AsyncValue<List<Movie>>> {
  /// See also [similarMovies].
  const SimilarMoviesFamily();

  /// See also [similarMovies].
  SimilarMoviesProvider call(int movieId) {
    return SimilarMoviesProvider(movieId);
  }

  @override
  SimilarMoviesProvider getProviderOverride(
    covariant SimilarMoviesProvider provider,
  ) {
    return call(provider.movieId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'similarMoviesProvider';
}

/// See also [similarMovies].
class SimilarMoviesProvider extends AutoDisposeFutureProvider<List<Movie>> {
  /// See also [similarMovies].
  SimilarMoviesProvider(int movieId)
    : this._internal(
        (ref) => similarMovies(ref as SimilarMoviesRef, movieId),
        from: similarMoviesProvider,
        name: r'similarMoviesProvider',
        debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
            ? null
            : _$similarMoviesHash,
        dependencies: SimilarMoviesFamily._dependencies,
        allTransitiveDependencies:
            SimilarMoviesFamily._allTransitiveDependencies,
        movieId: movieId,
      );

  SimilarMoviesProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.movieId,
  }) : super.internal();

  final int movieId;

  @override
  Override overrideWith(
    FutureOr<List<Movie>> Function(SimilarMoviesRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: SimilarMoviesProvider._internal(
        (ref) => create(ref as SimilarMoviesRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        movieId: movieId,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<Movie>> createElement() {
    return _SimilarMoviesProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is SimilarMoviesProvider && other.movieId == movieId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, movieId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin SimilarMoviesRef on AutoDisposeFutureProviderRef<List<Movie>> {
  /// The parameter `movieId` of this provider.
  int get movieId;
}

class _SimilarMoviesProviderElement
    extends AutoDisposeFutureProviderElement<List<Movie>>
    with SimilarMoviesRef {
  _SimilarMoviesProviderElement(super.provider);

  @override
  int get movieId => (origin as SimilarMoviesProvider).movieId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
