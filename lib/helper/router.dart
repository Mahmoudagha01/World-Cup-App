import 'package:flutter/material.dart';
import 'package:world_cup/helper/routs.dart';
import 'package:world_cup/presentation/views/layout.dart';
import '../presentation/views/home.dart';

Route<dynamic> onGenerate(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.layout:
      return MaterialPageRoute(builder: (context) => const Layout());
 case AppRoutes.home:
      return MaterialPageRoute(builder: (context) => const Home());
    default:
      return MaterialPageRoute(builder: ((context) => const Home()));
  }
}
