import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:world_cup/business_logic/cubit/services_cubit.dart';
import 'package:world_cup/helper/constants.dart';


class MatchTable extends StatefulWidget {
  const MatchTable({super.key});

  @override
  State<MatchTable> createState() => _MatchTableState();
}

class _MatchTableState extends State<MatchTable> {
  @override
  void initState() {
    BlocProvider.of<ServicesCubit>(context).getStandings();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
        BlocBuilder<ServicesCubit, ServicesState>(builder: (context, state) {
      if (state is StandingsLoadingState) {
        return const Center(child: CircularProgressIndicator());
      } else if (state is StandingsLoadedState) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
          child: ListView.builder(
              itemCount: state.data.standings.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                  child: Center(
                    child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.44,
                        child: Card(
                            clipBehavior: Clip.hardEdge,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  color: primaryColor,
                                  child: Column(
                                    children: [
                                      Text(
                                        state.data.standings[index].group,
                                        style: const TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                            height: 2),
                                      ),
                                      const SizedBox(height: 10),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 20,
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.38,
                                              child: const Text(
                                                'Team',
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            const Text(
                                              'GP',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            const Text(
                                              'W',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            const Text(
                                              'D',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            const Text(
                                              'L',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            const Text(
                                              'GD',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                            const Text(
                                              'PTS',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 16),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(height: 15),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 15),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: ListView.separated(
                                      physics: const ScrollPhysics(
                                          parent:
                                              NeverScrollableScrollPhysics()),
                                      shrinkWrap: true,
                                      itemBuilder: (context, tableindex) {
                                        return Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 150,
                                              child: Row(
                                                children: [
                                                  Text(
                                                    state
                                                        .data
                                                        .standings[index]
                                                        .table[tableindex]
                                                        .position
                                                        .toString(),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  SizedBox(
                                                    width: 40,
                                                    height: 35,
                                                    child: SvgPicture.network(
                                                        state
                                                            .data
                                                            .standings[index]
                                                            .table[tableindex]
                                                            .team
                                                            .image,
                                                        placeholderBuilder: (BuildContext
                                                                context) =>
                                                            Container(
                                                                padding:
                                                                    const EdgeInsets
                                                                            .all(
                                                                        30.0),
                                                                child:
                                                                    const CircularProgressIndicator())),
                                                  ),
                                                  const SizedBox(width: 10),
                                                  FittedBox(
                                                    child: Text(state
                                                                .data
                                                                .standings[
                                                                    index]
                                                                .table[
                                                                    tableindex]
                                                                .team
                                                                .name.length >=13
                                                        ? state
                                                                .data
                                                                .standings[
                                                                    index]
                                                                .table[
                                                                    tableindex]
                                                                .team.tla
                                                        : state
                                                            .data
                                                            .standings[index]
                                                            .table[tableindex]
                                                            .team
                                                            .name),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Text(
                                              state.data.standings[index]
                                                  .table[tableindex].playedGames
                                                  .toString(),
                                            ),
                                            Text(state.data.standings[index]
                                                .table[tableindex].won
                                                .toString()),
                                            Text(
                                              state.data.standings[index]
                                                  .table[tableindex].draw
                                                  .toString(),
                                            ),
                                            Text(
                                              state.data.standings[index]
                                                  .table[tableindex].lost
                                                  .toString(),
                                            ),
                                            Text(state
                                                .data
                                                .standings[index]
                                                .table[tableindex]
                                                .goalDifference
                                                .toString()),
                                            Text(
                                              state.data.standings[index]
                                                  .table[tableindex].points
                                                  .toString(),
                                            ),
                                          ],
                                        );
                                      },
                                      separatorBuilder: (context, index) =>
                                          const Divider(
                                            color: primaryColor,
                                          ),
                                      itemCount: 4),
                                )
                              ],
                            ))),
                  ),
                );
    
              }),
        );
      } else {
        return const SizedBox();
      }
    }));
  }
}
