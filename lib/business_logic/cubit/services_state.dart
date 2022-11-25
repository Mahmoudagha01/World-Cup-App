part of 'services_cubit.dart';

@immutable
abstract class ServicesState {}

class ServicesInitial extends ServicesState {}

class StandingsLoadingState extends ServicesState {}

class StandingsLoadedState extends ServicesState {
  final TableModel data;

  StandingsLoadedState(this.data);
}

class StandingsErrorState extends ServicesState {
  final String message;

  StandingsErrorState(this.message);
}

class MatchesLoadingState extends ServicesState {}

class MatchesLoadedState extends ServicesState {
  final MatchModel data;

  MatchesLoadedState(this.data);
}

class MatchesErrorState extends ServicesState {
  final String message;

  MatchesErrorState(this.message);
}

class MatchdetailsLoadingState extends ServicesState {}

class MatchdetailsLoadedState extends ServicesState {
  final StatsModel data;

  MatchdetailsLoadedState(this.data);
}

class MatchdetailsErrorState extends ServicesState {
  final String message;

  MatchdetailsErrorState(this.message);
}
