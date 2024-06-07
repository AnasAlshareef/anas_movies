
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/favorites.dart';
import '../../../data/repository/repo.dart';

part 'favorites_state.dart';

class FavoritesCubit extends Cubit<FavoritesState> {
  final Repo repo;
  FavoritesCubit(this.repo) : super(FavoritesInitial());

  Future <void> addFavorite(int id , String type , bool favorite)async{
    final add= await repo.addFavorite(id, favorite, type);
    emit(FavoritesAdded(add));
    getFavorites();

  }
  Future<void> getFavorites()async{
    emit(FavoritesLoading());
      try{
      final get =await repo.getFavorites();
      emit(FavoritesDone(get));
     // emit(FavoritesError("Error"));

      }catch(e){
      emit(FavoritesError("Error"));
      }

  }
}
