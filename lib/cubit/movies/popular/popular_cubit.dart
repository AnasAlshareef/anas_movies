import 'package:anas_movies/data/models/nowplaying.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/popularmovies.dart';
import '../../../data/repository/repo.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  final RepoIm webService ;

  PopularCubit(this.webService) : super(PopularInitial());

  Future<void > getpopular()async{
    emit(PopularLoading());
    final pop =  await webService.getPopularMovies();
    emit(PopularDone(pop));
  }
}
