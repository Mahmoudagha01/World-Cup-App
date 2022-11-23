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
