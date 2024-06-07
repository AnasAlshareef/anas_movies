part of 'toprated_cubit.dart';

@immutable
abstract class TopratedState {}

class TopratedInitial extends TopratedState {}

class TopratedLoading extends TopratedState {}

class TopratedDone extends TopratedState {
  final List<TopRated> top;

  TopratedDone(this.top);
}
