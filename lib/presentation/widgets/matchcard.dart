import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../helper/constants.dart';

class MatchCard extends StatelessWidget {
  final String homeTeam;
  final String homeImage;
  final String awayTeam;
  final String awayImage;
  final String compettion;
    final String date;
final String homeScore;
  final String awayScore;    

  const MatchCard({
    super.key,
    required this.homeTeam,
    required this.homeImage,
    required this.awayTeam,
    required this.awayImage, required this.compettion, required this.date, required this.homeScore, required this.awayScore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            clipBehavior: Clip.antiAliasWithSaveLayer,
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 6,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 3,
                  blurRadius: 5,
                  offset: const Offset(0, 0), 
                ),
              ],
              color: Colors.white,
              borderRadius: BorderRadius.circular(50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                    image: DecorationImage(
                        image: AssetImage("assets/images/pattern.png"),
                        fit: BoxFit.fitHeight),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(homeTeam,style: TextStyle( 
                                                  color: Colors.white,
                                                  fontSize: 16),),
                      SizedBox(
                        width: 40,
                        height: 35,
                        child: SvgPicture.asset(homeImage,
                            placeholderBuilder: (BuildContext context) =>
                                Container(
                                    padding: const EdgeInsets.all(30.0),
                                    child: const CircularProgressIndicator())),
                      ),
                    ],
                  ),
                ),
                Text(homeScore),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(compettion),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 10),
                      child: Text("VS"),
                    ),
                    Text(date),
                  ],
                ),
                Text(awayScore),
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height / 6,
                  decoration: BoxDecoration(
                    color: primaryColor,
                    image: const DecorationImage(
                        image: AssetImage("assets/images/pattern.png"),
                        fit: BoxFit.fitHeight),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(awayTeam,style: TextStyle( 
                                                  color: Colors.white,
                                                  fontSize: 16),),
                        SizedBox(
                          width: 40,
                          height: 35,
                          child: SvgPicture.asset(awayImage,
                              placeholderBuilder: (BuildContext context) =>
                                  Container(
                                      padding: const EdgeInsets.all(30.0),
                                      child:
                                          const CircularProgressIndicator())),
                        ),
                      ]),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
