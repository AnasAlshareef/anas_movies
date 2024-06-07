part of 'nowplaying_cubit.dart';

@immutable
abstract class NowplayingState {}

class NowplayingInitial extends NowplayingState {}

class NowplayingLoading extends NowplayingState {}

class NowplayingDone extends NowplayingState {
  final List<NowPlaying> nowplaying;

  NowplayingDone(this.nowplaying);
}
