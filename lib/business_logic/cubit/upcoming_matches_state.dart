part of 'upcoming_matches_cubit.dart';

@immutable
abstract class UpcomingMatchesState {}

class UpcomingMatchesInitial extends UpcomingMatchesState {}

class UpcomingMatchesLoading extends UpcomingMatchesState {}

class UpcomingMatchesLoaded extends UpcomingMatchesState {
  final UpcomingMatchModel data;

  UpcomingMatchesLoaded(this.data);
}

class UpcomingMatchesError extends UpcomingMatchesState {
  final String message;

  UpcomingMatchesError(this.message);
}
