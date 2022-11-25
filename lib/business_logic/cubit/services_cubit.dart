// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:world_cup/data/models/match.dart';
import 'package:world_cup/data/models/news.dart';

import 'package:world_cup/data/repository/app_repository.dart';

import '../../data/models/standing.dart';
import '../../data/models/stats.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit(
    this.appRepository,
  ) : super(ServicesInitial());
  final AppRepository appRepository;
  TableModel? tableData;
  MatchModel? matchData;
  NewsModel? newsData;
  StatsModel? statsData;
  Future<TableModel?> getStandings() async {
    try {
      emit(StandingsLoadingState());
      tableData = await appRepository.getStanding();
      emit(StandingsLoadedState(tableData!));
    } catch (e) {
      emit(StandingsErrorState("Error in Fetching Data"));
    }
    return tableData;
  }

  Future<MatchModel?> getMatches() async {
    try {
      emit(MatchesLoadingState());
      matchData = await appRepository.getMatches();
      emit(MatchesLoadedState(matchData!));
    } catch (e) {
      emit(MatchesErrorState("Error in Fetching Data"));
    }
    return matchData;
  }

  Future<StatsModel?> getMatchDetails(int id) async {
    try {
      emit(MatchdetailsLoadingState());
      statsData = await appRepository.getMatchStats(id);
      emit(MatchdetailsLoadedState(statsData!));
    } catch (e) {
      emit(MatchdetailsErrorState(e.toString()));
    }
    return statsData;
  }
}
