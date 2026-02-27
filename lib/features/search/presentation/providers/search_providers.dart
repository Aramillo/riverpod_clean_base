import 'dart:async';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_clean_base/core/network/dio_client.dart';
import 'package:riverpod_clean_base/features/home/domain/entities/movie.dart';
import 'package:riverpod_clean_base/features/search/data/datasources/search_remote_datasource.dart';
import 'package:riverpod_clean_base/features/search/data/repositories/search_repository_impl.dart';
import 'package:riverpod_clean_base/features/search/domain/repositories/search_repository.dart';
import 'package:riverpod_clean_base/features/search/domain/usecases/search_movies_usecase.dart';

part 'search_providers.g.dart';

@riverpod
SearchRemoteDatasource searchRemoteDatasource(SearchRemoteDatasourceRef ref) {
  return SearchRemoteDatasource(ref.watch(dioProvider));
}

@riverpod
SearchRepository searchRepository(SearchRepositoryRef ref) {
  return SearchRepositoryImpl(ref.watch(searchRemoteDatasourceProvider));
}

@riverpod
SearchMoviesUseCase searchMoviesUseCase(SearchMoviesUseCaseRef ref) {
  return SearchMoviesUseCase(ref.watch(searchRepositoryProvider));
}

@riverpod
class SearchQuery extends _$SearchQuery {
  @override
  String build() => '';

  void update(String query) => state = query;
}

@riverpod
Future<List<Movie>> searchResults(SearchResultsRef ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.trim().isEmpty) return [];

  // Debounce 500ms
  await Future<void>.delayed(const Duration(milliseconds: 500));
  if (ref.state is! AsyncLoading) return ref.state.valueOrNull ?? [];

  final useCase = ref.watch(searchMoviesUseCaseProvider);
  final result = await useCase(query);
  return result.fold(
    (failure) => throw failure,
    (movies) => movies,
  );
}
