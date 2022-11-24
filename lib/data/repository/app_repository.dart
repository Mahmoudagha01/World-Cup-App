// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:world_cup/data/API/ApiServices.dart';
import 'package:world_cup/data/models/match.dart';
import 'package:world_cup/data/models/standing.dart';

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
    print(data);
    return NewsModel.fromJson(data);
  }
}
