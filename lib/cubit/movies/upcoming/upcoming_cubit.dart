import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/upcoming.dart';
import '../../../data/repository/repo.dart';

part 'upcoming_state.dart';

class UpcomingCubit extends Cubit<UpcomingState> {
  final RepoIm webService ;

  UpcomingCubit(this.webService) : super(UpcomingInitial());


  Future<void> getUpcoming()async{
    emit(UpcomingLoading());
    final upcoming = await webService.getUpComing();
    emit(UpcomingDone(upcoming));
  }
}
