// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import 'package:world_cup/data/repository/app_repository.dart';

import '../../data/models/standing.dart';

part 'services_state.dart';

class ServicesCubit extends Cubit<ServicesState> {
  ServicesCubit(
    this.appRepository,
  
  ) : super(ServicesInitial());
  final AppRepository appRepository;
  TableModel ?tableData;
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
}
