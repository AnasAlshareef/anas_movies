import 'package:anas_movies/data/repository/repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/nowplaying.dart';
import '../../../data/server/webservices.dart';

part 'nowplaying_state.dart';

class NowplayingCubit extends Cubit<NowplayingState> {

  final RepoIm webService ;

  NowplayingCubit( this.webService) : super(NowplayingInitial());

  Future<void> getNowPlaying()async{
    emit(NowplayingLoading());
    final now =await webService.getNowPlaying();
    emit(NowplayingDone(now));
  }
}
