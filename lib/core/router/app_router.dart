import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_clean_base/core/router/route_names.dart';
import 'package:riverpod_clean_base/features/auth/presentation/pages/login_page.dart';
import 'package:riverpod_clean_base/features/auth/presentation/providers/auth_provider.dart';
import 'package:riverpod_clean_base/features/favorites/presentation/pages/favorites_page.dart';
import 'package:riverpod_clean_base/features/home/presentation/pages/home_page.dart';
import 'package:riverpod_clean_base/features/movie_detail/presentation/pages/movie_detail_page.dart';
import 'package:riverpod_clean_base/features/search/presentation/pages/search_page.dart';
import 'package:riverpod_clean_base/features/settings/presentation/pages/settings_page.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final authState = ref.watch(authNotifierProvider);

  return GoRouter(
    navigatorKey: _rootNavigatorKey,
    initialLocation: RoutePaths.home,
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull ?? false;
      final isLoginRoute = state.matchedLocation == RoutePaths.login;

      if (!isLoggedIn && !isLoginRoute) return RoutePaths.login;
      if (isLoggedIn && isLoginRoute) return RoutePaths.home;
      return null;
    },
    routes: [
      GoRoute(
        path: RoutePaths.login,
        name: RouteNames.login,
        builder: (context, state) => const LoginPage(),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) => _ScaffoldWithNav(child: child),
        routes: [
          GoRoute(
            path: RoutePaths.home,
            name: RouteNames.home,
            builder: (context, state) => const HomePage(),
          ),
          GoRoute(
            path: RoutePaths.search,
            name: RouteNames.search,
            builder: (context, state) => const SearchPage(),
          ),
          GoRoute(
            path: RoutePaths.favorites,
            name: RouteNames.favorites,
            builder: (context, state) => const FavoritesPage(),
          ),
          GoRoute(
            path: RoutePaths.settings,
            name: RouteNames.settings,
            builder: (context, state) => const SettingsPage(),
          ),
        ],
      ),
      GoRoute(
        path: RoutePaths.movieDetail,
        name: RouteNames.movieDetail,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (context, state) {
          final id = int.parse(state.pathParameters['id']!);
          return MovieDetailPage(movieId: id);
        },
      ),
    ],
  );
}

class _ScaffoldWithNav extends StatelessWidget {
  final Widget child;
  const _ScaffoldWithNav({required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: NavigationBar(
        selectedIndex: _calculateIndex(context),
        onDestinationSelected: (index) => _onTap(context, index),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.home_outlined),
            selectedIcon: Icon(Icons.home),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(Icons.search_outlined),
            selectedIcon: Icon(Icons.search),
            label: 'Search',
          ),
          NavigationDestination(
            icon: Icon(Icons.favorite_outline),
            selectedIcon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings_outlined),
            selectedIcon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }

  int _calculateIndex(BuildContext context) {
    final location = GoRouterState.of(context).matchedLocation;
    if (location.startsWith(RoutePaths.search)) return 1;
    if (location.startsWith(RoutePaths.favorites)) return 2;
    if (location.startsWith(RoutePaths.settings)) return 3;
    return 0;
  }

  void _onTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        context.goNamed(RouteNames.home);
      case 1:
        context.goNamed(RouteNames.search);
      case 2:
        context.goNamed(RouteNames.favorites);
      case 3:
        context.goNamed(RouteNames.settings);
    }
  }
}
