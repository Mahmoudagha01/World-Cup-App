// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:world_cup/data/repository/app_repository.dart';

import '../../data/models/upcomingmatch.dart';

part 'upcoming_matches_state.dart';

class UpcomingMatchesCubit extends Cubit<UpcomingMatchesState> {
  UpcomingMatchesCubit(
    this.appRepository,
  ) : super(UpcomingMatchesInitial());

  final AppRepository appRepository;
  UpcomingMatchModel? upcomingMatchData;

  Future<UpcomingMatchModel?> getUpcomingMatches() async {
    try {
      emit(UpcomingMatchesLoading());
      upcomingMatchData = await appRepository.getUpcomingMatches();
      emit(UpcomingMatchesLoaded(upcomingMatchData!));
    } catch (e) {
      emit(UpcomingMatchesError(e.toString()));
    }
    return upcomingMatchData;
  }
}
