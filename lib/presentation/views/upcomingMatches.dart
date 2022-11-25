import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_cup/business_logic/cubit/upcoming_matches_cubit.dart';
import 'package:world_cup/helper/constants.dart';
import '../../helper/routs.dart';
import '../widgets/matchcard.dart';

class UpcomingMatches extends StatefulWidget {
  const UpcomingMatches({super.key});

  @override
  State<UpcomingMatches> createState() => _UpcomingMatchesState();
}

class _UpcomingMatchesState extends State<UpcomingMatches> {
  @override
  void initState() {
    BlocProvider.of<UpcomingMatchesCubit>(context).getUpcomingMatches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Upcoming Matches",
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
      body: SafeArea(
          child: BlocBuilder<UpcomingMatchesCubit, UpcomingMatchesState>(
        builder: (context, state) {
          if (state is UpcomingMatchesLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is UpcomingMatchesLoaded) {
            final data = state.data.data.fixtures;
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return MatchCard(
                  homeTeam: data[index].homeName,
                  homeImage: "assets/images/${data[index].homeName}.svg",
                  awayTeam: data[index].awayName,
                  awayImage: "assets/images/${data[index].awayName}.svg",
                  compettion: "${data[index].time.split(":").first}:${data[index].time.split(":").last}",
                  date: data[index].date,
                  awayScore: data[index].ftScore.split(':').last,
                  homeScore: data[index].ftScore.split(':').first,
                );
              },
            );
          } else if (state is UpcomingMatchesError) {
            return Center(child: Text(state.message));
          } else {
            return const SizedBox();
          }
        },
      )),
    );
  }
}
