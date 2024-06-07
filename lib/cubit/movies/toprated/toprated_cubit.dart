import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../data/models/toprated.dart';
import '../../../data/repository/repo.dart';

part 'toprated_state.dart';

class TopratedCubit extends Cubit<TopratedState> {
  final RepoIm webService ;

  TopratedCubit(this.webService) : super(TopratedInitial());

  Future<void> getTopReted()async{
    emit(TopratedLoading());
    final top = await webService.getTopRated();
    emit(TopratedDone(top));
  }
}
