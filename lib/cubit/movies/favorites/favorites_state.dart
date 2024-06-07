part of 'favorites_cubit.dart';

@immutable
sealed class FavoritesState {}

final class FavoritesInitial extends FavoritesState {}
final class FavoritesLoading extends FavoritesState {}
final class FavoritesAdded extends FavoritesState {
  final bool isFav;

  FavoritesAdded(this.isFav);
}

final class FavoritesDone extends FavoritesState {
  final List<Favorites> favorites;

  FavoritesDone(this.favorites);
}
final class FavoritesError extends FavoritesState {
  final String Error;

  FavoritesError(this.Error);
}
