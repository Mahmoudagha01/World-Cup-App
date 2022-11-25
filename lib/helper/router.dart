import 'package:flutter/material.dart';
import 'package:world_cup/data/models/match.dart';
import 'package:world_cup/data/models/news.dart';
import 'package:world_cup/helper/routs.dart';
import 'package:world_cup/presentation/views/finishedmatch.dart';
import 'package:world_cup/presentation/views/layout.dart';
import 'package:world_cup/presentation/views/newsdetails.dart';
import 'package:world_cup/presentation/views/splash.dart';
import '../presentation/views/home.dart';
import '../presentation/views/matchdetails.dart';


Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
     case AppRoutes.splash:
      return MaterialPageRoute(builder: (context) => const SplashScreen());
    case AppRoutes.layout:
      return MaterialPageRoute(builder: (context) => const Layout());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const Home());
    case AppRoutes.finishedMatches:
      return MaterialPageRoute(builder: (context) => const FinishedMatches());
    case AppRoutes.newsDeails:
      final data = settings.arguments as Articles;
      return MaterialPageRoute(
          builder: (context) => NewsDetails(
                data: data,
              ));
    case AppRoutes.matchDetails:
      final data = settings.arguments as Match;
      return MaterialPageRoute(
          builder: (context) =>  MatchDetails(matchData: data,));
    default:
      return MaterialPageRoute(builder: ((context) => const Home()));
  }
}
