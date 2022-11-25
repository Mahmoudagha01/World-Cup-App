import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_cup/business_logic/cubit/news_cubit.dart';
import 'package:world_cup/business_logic/cubit/services_cubit.dart';
import 'package:world_cup/helper/constants.dart';
import 'package:world_cup/helper/routs.dart';
import 'package:world_cup/presentation/widgets/matchcard.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../widgets/carousel.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<NewsCubit>(context).getNews();
    BlocProvider.of<ServicesCubit>(context).getMatches();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<NewsCubit, NewsState>(
            builder: (context, state) {
              if (state is NewsLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is NewsLoadedState) {
                final data = state.data.articles;
                return CarouselSlider.builder(
                    itemCount: state.data.articles.length,
                    options: CarouselOptions(
                        initialPage: 0,
                        autoPlay: true,
                        height: MediaQuery.of(context).size.height * 0.25),
                    itemBuilder: (context, index, i) => InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, AppRoutes.newsDeails,
                                arguments: data[index]);
                          },
                          child: Carousel(
                            date: data[index].publishedAt,
                            images: data[index].urlToImage,
                            title: data[index].title,
                          ),
                        ));
              } else if (state is NewsErrorState) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox();
              }
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Finished Matches"),
                InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, AppRoutes.finishedMatches);
                    },
                    child: const Text(
                      "Show All>>",
                      style: TextStyle(color: primaryColor),
                    ))
              ],
            ),
          ),
          BlocBuilder<ServicesCubit, ServicesState>(
            builder: (context, state) {
              if (state is MatchesLoadingState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is MatchesLoadedState) {
                final data = state.data.data.match.reversed.toList();
                return SizedBox(
                  height: MediaQuery.of(context).size.height * 0.5,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    itemCount: state.data.data.match.length ~/
                            state.data.data.match.length +
                        3,
                    itemBuilder: (context, index) {
                      return MatchCard(
                        homeTeam: data[index].homeName,
                        homeImage: "assets/images/${data[index].homeName}.svg",
                        awayTeam: data[index].awayName,
                        awayImage: "assets/images/${data[index].awayName}.svg",
                        compettion: data[index].status,
                        date: data[index].date,
                        awayScore: data[index].ftScore.split('-').last,
                        homeScore: data[index].ftScore.split('-').first,
                      );
                    },
                  ),
                );
              } else if (state is MatchesErrorState) {
                return Center(child: Text(state.message));
              } else {
                return const SizedBox();
              }
            },
          ),
        ],
      ),
    ));
  }
}
