class ApiConstants {
  static const String baseUrl = 'https://api.themoviedb.org/3';
  static const String imageBaseUrl = 'https://image.tmdb.org/t/p';

  // Image sizes
  static const String posterW185 = '$imageBaseUrl/w185';
  static const String posterW342 = '$imageBaseUrl/w342';
  static const String posterW500 = '$imageBaseUrl/w500';
  static const String backdropW780 = '$imageBaseUrl/w780';
  static const String backdropOriginal = '$imageBaseUrl/original';
  static const String profileW185 = '$imageBaseUrl/w185';

  // Endpoints
  static const String trending = '/trending/movie/week';
  static const String popular = '/movie/popular';
  static const String searchMovie = '/search/movie';
  static const String guestSession = '/authentication/guest_session/new';

  static String movieDetail(int id) => '/movie/$id';
  static String movieCredits(int id) => '/movie/$id/credits';
  static String similarMovies(int id) => '/movie/$id/similar';
}
