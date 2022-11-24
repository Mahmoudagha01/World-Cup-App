import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:world_cup/business_logic/cubit/services_cubit.dart';
import 'package:world_cup/helper/constants.dart';
import 'package:world_cup/presentation/widgets/matchcard.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    BlocProvider.of<ServicesCubit>(context).getMatches();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: BlocBuilder<ServicesCubit, ServicesState>(
      builder: (context, state) {
        if (state is MatchesLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is MatchesLoadedState) {
          final data = state.data.data.match;
          return ListView.builder(
            itemCount: state.data.data.match.length,
            itemBuilder: (context, index) {
              return MatchCard(
                homeTeam: data[index].homeName,
                homeImage:
                    "assets/images/${data[index].homeName}.svg",
                awayTeam: data[index].awayName,
                awayImage:
                    "assets/images/${data[index].awayName}.svg",
                compettion:data[index].status,
                date: data[index].date,
                awayScore: data[index].ftScore.split('-').last, homeScore: data[index].ftScore.split('-').first,
              );
            },
          );
        } else if (state is MatchesErrorState) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      },
    ));
  }
}
