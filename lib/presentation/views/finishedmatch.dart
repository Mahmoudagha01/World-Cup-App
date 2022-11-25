import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:world_cup/business_logic/cubit/services_cubit.dart';
import 'package:world_cup/helper/constants.dart';

import 'package:world_cup/presentation/widgets/matchcard.dart';

import '../../helper/routs.dart';

class FinishedMatches extends StatefulWidget {
  const FinishedMatches({super.key});

  @override
  State<FinishedMatches> createState() => _FinishedMatchesState();
}

class _FinishedMatchesState extends State<FinishedMatches> {
  @override
  void initState() {
    BlocProvider.of<ServicesCubit>(context).getMatches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Finished Matches",
          style: TextStyle(fontSize: 18, color: primaryColor),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/logo.png"),
          ),
        ],
        leading: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: primaryColor,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(child: BlocBuilder<ServicesCubit, ServicesState>(
        builder: (context, state) {
          if (state is MatchesLoadingState) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MatchesLoadedState) {
            final data = state.data.data.match;
            return ListView.builder(
              itemCount: state.data.data.match.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutes.matchDetails,
                        arguments: data[index]);
                  },
                  child: MatchCard(
                    homeTeam: data[index].homeName,
                    homeImage: "assets/images/${data[index].homeName}.svg",
                    awayTeam: data[index].awayName,
                    awayImage: "assets/images/${data[index].awayName}.svg",
                    compettion: data[index].status,
                    date: data[index].date,
                    awayScore: data[index].ftScore.split('-').last,
                    homeScore: data[index].ftScore.split('-').first,
                  ),
                );
              },
            );
          } else if (state is MatchesErrorState) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      )),
    );
  }
}
