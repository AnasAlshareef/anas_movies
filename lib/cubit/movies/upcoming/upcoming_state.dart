part of 'upcoming_cubit.dart';

@immutable
abstract class UpcomingState {}

class UpcomingInitial extends UpcomingState {}
class UpcomingLoading extends UpcomingState {}
class UpcomingDone extends UpcomingState {
  final List<UpComing> upcoming;

  UpcomingDone(this.upcoming);
}
