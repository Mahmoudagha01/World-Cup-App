import 'package:world_cup/data/API/ApiServices.dart';
import 'package:world_cup/data/models/match.dart';
import 'package:world_cup/data/models/standing.dart';
import 'package:world_cup/data/models/stats.dart';
import 'package:world_cup/data/models/upcomingmatch.dart';

import '../models/news.dart';

class AppRepository {
  APIServices apiServices;
  AppRepository({
    required this.apiServices,
  });
  Future<TableModel> getStanding() async {
    final data = await apiServices.getStanding();
    return TableModel.fromJson(data);
  }

  Future<MatchModel> getMatches() async {
    final data = await apiServices.getMatches();
    return MatchModel.fromJson(data);
  }

  Future<NewsModel> getNews() async {
    final data = await apiServices.getNews();
    return NewsModel.fromJson(data);
  }

  Future<StatsModel> getMatchStats(int id) async {
    final data = await apiServices.getMatchDetails(id);
    return StatsModel.fromJson(data);
  }

  Future<UpcomingMatchModel> getUpcomingMatches() async {
    final response = await apiServices.getUpcomingMatches();
    return UpcomingMatchModel.fromJson(response);
  }
}
