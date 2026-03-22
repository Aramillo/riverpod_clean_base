# Riverpod Clean Base

Base arquitectónica para proyectos Flutter que implementa **Clean Architecture** con **Riverpod** como sistema de gestión de estado e inyección de dependencias. Incluye una app de demostración (catálogo de películas con TMDB API) que ejemplifica cada patrón.

## Objetivo

Servir como punto de partida para nuevos proyectos Flutter, proporcionando:

- Estructura de carpetas escalable por features
- Patrones de estado probados (async, paginación, debounce, persistencia local)
- Manejo de errores funcional con `Either` y `Failure` sealed classes
- Configuración de red (Dio + interceptores) lista para producción
- Sistema de temas con Material 3 y persistencia de preferencias
- Navegación declarativa con GoRouter y guards de autenticación

## Arquitectura

```
lib/
├── core/                  # Infraestructura compartida
│   ├── config/            # Variables de entorno (.env)
│   ├── constants/         # Constantes de API y rutas
│   ├── errors/            # Failure sealed class (server, network, cache, validation)
│   ├── network/           # Dio client + interceptores (auth, logging)
│   ├── providers/         # Providers raíz (SharedPreferences)
│   ├── router/            # GoRouter + guards + route names
│   └── theme/             # Temas light/dark, color schemes, tipografía
│
├── features/              # Módulos por feature
│   └── <feature>/
│       ├── data/          # Datasources, models, repository impl
│       ├── domain/        # Entities, repository contracts, usecases
│       └── presentation/  # Pages, providers, widgets
│
├── shared/                # Código compartido entre features
│   ├── data/models/       # PaginatedResponse genérico
│   ├── domain/            # UseCase base class, NoParams
│   └── presentation/      # Widgets reutilizables (AppImage, ErrorView, etc.)
│
├── app.dart               # MaterialApp.router raíz
└── main.dart              # Entry point con ProviderScope
```

### Capas

| Capa | Responsabilidad | Ejemplo |
|------|----------------|---------|
| **Data** | Comunicación con APIs y almacenamiento local. Transforma JSON en modelos y modelos en entidades del dominio. | `HomeRemoteDatasource` → `HomeRepositoryImpl` |
| **Domain** | Lógica de negocio pura. Define contratos (repositories abstractos), entidades inmutables y casos de uso. | `GetTrendingMoviesUseCase` → `Either<Failure, List<Movie>>` |
| **Presentation** | UI y gestión de estado. Providers de Riverpod consumen usecases y exponen estado reactivo. | `trendingMoviesProvider` → `HomePage` |

### Flujo de datos

```
UI (Consumer) → Provider → UseCase → Repository (impl) → Datasource → API/Local
                                         ↓
                              Either<Failure, Entity>
```

## Patrones de Riverpod incluidos

### 1. Async simple (lectura única)

```dart
@riverpod
Future<List<Movie>> trendingMovies(TrendingMoviesRef ref) async {
  final useCase = ref.watch(getTrendingMoviesUseCaseProvider);
  final result = await useCase(const NoParams());
  return result.fold((failure) => throw failure, (movies) => movies);
}
```

### 2. StateNotifier con paginación

```dart
@riverpod
class PopularMoviesNotifier extends _$PopularMoviesNotifier {
  int _page = 1;

  @override
  Future<List<Movie>> build() async => _fetchPage(1);

  Future<void> fetchNextPage() async {
    _page++;
    final newMovies = await _fetchPage(_page);
    final current = state.valueOrNull ?? [];
    state = AsyncData([...current, ...newMovies]);
  }
}
```

### 3. Búsqueda con debounce

```dart
@riverpod
Future<List<Movie>> searchResults(SearchResultsRef ref) async {
  final query = ref.watch(searchQueryProvider);
  if (query.trim().isEmpty) return [];
  await Future<void>.delayed(const Duration(milliseconds: 500));
  // cancela si el query cambió durante el delay
}
```

### 4. Providers parametrizados

```dart
@riverpod
Future<List<Movie>> similarMovies(SimilarMoviesRef ref, int movieId) async {
  // Uso: ref.watch(similarMoviesProvider(movieId))
}
```

### 5. Estado local con persistencia

```dart
@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    final prefs = ref.watch(sharedPreferencesProvider);
    return ThemeMode.values[prefs.getInt('theme_mode') ?? 0];
  }

  void setThemeMode(ThemeMode mode) {
    ref.read(sharedPreferencesProvider).setInt('theme_mode', mode.index);
    state = mode;
  }
}
```

## Manejo de errores

Enfoque funcional con `dartz` (`Either<Failure, T>`):

```dart
@freezed
sealed class Failure with _$Failure {
  const factory Failure.server({required String message, int? statusCode}) = ServerFailure;
  const factory Failure.network({String? message}) = NetworkFailure;
  const factory Failure.cache({String? message}) = CacheFailure;
  const factory Failure.validation({required String message}) = ValidationFailure;
  const factory Failure.unknown({String? message}) = UnknownFailure;
}
```

Los repositorios capturan excepciones y retornan `Left(Failure)`. Los providers hacen `fold` y lanzan el `Failure` como excepción para que la UI lo maneje con `.when(loading, error, data)`.

## Features de demostración

| Feature | Patrón demostrado |
|---------|-------------------|
| **Home** | Carrusel + grid con paginación infinita, shimmer loading |
| **Search** | Debounce de 500ms, estados vacío/loading/resultados |
| **Favorites** | Persistencia local con SharedPreferences, estado compartido |
| **Movie Detail** | Providers parametrizados, datos paralelos (detalle + cast + similares) |
| **Settings** | Selector de tema (light/dark/system), 6 color schemes persistentes |
| **Auth** | Sesión guest con expiración, guard de rutas |

## Stack técnico

| Categoría | Tecnología |
|-----------|-----------|
| Estado | `flutter_riverpod` + `riverpod_annotation` |
| Navegación | `go_router` |
| HTTP | `dio` con interceptores |
| Modelos | `freezed` + `json_serializable` |
| Errores | `dartz` (Either) + Failure sealed class |
| Persistencia | `shared_preferences` |
| Env | `flutter_dotenv` |
| Imágenes | `cached_network_image` + `shimmer` |
| Tipografía | `google_fonts` |

## Setup

```bash
# 1. Clonar el repositorio
git clone <repo-url>
cd riverpod_clean_base

# 2. Crear archivo .env en la raíz
TMDB_API_KEY=tu_api_key
TMDB_ACCESS_TOKEN=tu_access_token

# 3. Instalar dependencias
flutter pub get

# 4. Generar código (freezed, json_serializable, riverpod)
dart run build_runner build --delete-conflicting-outputs

# 5. Ejecutar
flutter run
```

## Cómo usar como base para un nuevo proyecto

1. **Clonar y renombrar** el proyecto.
2. **Conservar `core/` y `shared/`** — contienen la infraestructura reutilizable.
3. **Eliminar `features/`** — son la demo. Crear tus propios features siguiendo la misma estructura `data/domain/presentation`.
4. **Ajustar `core/constants/`** con las URLs y endpoints de tu API.
5. **Modificar `core/theme/`** con tu paleta de colores y tipografía.
6. **Actualizar `core/router/`** con las rutas de tu app.

Cada feature nuevo debe seguir esta estructura:

```
features/mi_feature/
├── data/
│   ├── datasources/       # Llamadas a API o almacenamiento local
│   ├── models/            # Modelos JSON con toEntity()
│   └── repositories/      # Implementación del contrato del dominio
├── domain/
│   ├── entities/          # Entidades inmutables (freezed)
│   ├── repositories/      # Contrato abstracto
│   └── usecases/          # Casos de uso con Either<Failure, T>
└── presentation/
    ├── pages/             # Páginas (ConsumerWidget)
    ├── providers/         # Providers de Riverpod (@riverpod)
    └── widgets/           # Widgets específicos del feature
```
