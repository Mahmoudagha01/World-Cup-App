import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:world_cup/business_logic/cubit/services_cubit.dart';
import 'package:world_cup/data/models/match.dart';
import 'package:world_cup/presentation/widgets/matchcard.dart';
import '../../helper/constants.dart';

class MatchDetails extends StatefulWidget {
  const MatchDetails({
    Key? key,
    required this.matchData,
  }) : super(key: key);
  final Match matchData;

  @override
  State<MatchDetails> createState() => _MatchDetailsState();
}

class _MatchDetailsState extends State<MatchDetails> {
  @override
  void initState() {
    BlocProvider.of<ServicesCubit>(context)
        .getMatchDetails(widget.matchData.id);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            "assets/images/qatar.png",
            width: MediaQuery.of(context).size.width * 0.21,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset("assets/images/logo.png"),
          ),
        ],
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
            BlocProvider.of<ServicesCubit>(context).getMatches();
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: primaryColor,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            MatchCard(
                homeTeam: widget.matchData.homeName,
                homeImage: 'assets/images/${widget.matchData.homeName}.svg',
                awayTeam: widget.matchData.awayName,
                awayImage: 'assets/images/${widget.matchData.awayName}.svg',
                compettion: widget.matchData.status,
                date: widget.matchData.date,
                homeScore: widget.matchData.ftScore.split("-").first,
                awayScore: widget.matchData.ftScore.split("-").last),
            const Divider(),
            Text(
              "Match Stats".toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: primaryColor),
            ),
            const Divider(),
            BlocBuilder<ServicesCubit, ServicesState>(
              builder: (context, state) {
                if (state is MatchdetailsLoadingState) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is MatchdetailsLoadedState) {
                  return Card(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "${state.data.data.possesion.split(":").first}%",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                "Possession".toUpperCase(),
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: primaryColor),
                              ),
                              Text(
                                "${state.data.data.possesion.split(":").last}%",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                  state.data.data.shotsoffTarget
                                      .split(":")
                                      .first,
                                  style: Theme.of(context).textTheme.bodyLarge),
                              Text(
                                "SHOTS",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: primaryColor,
                                    ),
                              ),
                              Text(
                                state.data.data.shotsoffTarget.split(":").last,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.data.data.shotsonTarget.split(":").first,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                "SHOTS ON TARGET",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(
                                      color: primaryColor,
                                    ),
                              ),
                              Text(
                                state.data.data.shotsonTarget.split(":").last,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.data.data.corners.split(":").first,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                "CORNERS",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: primaryColor),
                              ),
                              Text(
                                state.data.data.corners.split(":").last,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.data.data.penalties.split(":").first,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                "PENALTIES",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: primaryColor),
                              ),
                              Text(
                                state.data.data.penalties.split(":").last,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.data.data.fauls.split(":").first,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                "FOULS",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: primaryColor),
                              ),
                              Text(
                                state.data.data.fauls.split(":").last,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.data.data.offsides.split(":").first,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                "OFFSIDES",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: primaryColor),
                              ),
                              Text(
                                state.data.data.offsides.split(":").last,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.data.data.yellowCards.split(":").first,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                "YELLOW CARDS",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: primaryColor),
                              ),
                              Text(
                                state.data.data.yellowCards.split(":").last,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 30),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                state.data.data.redCards.split(":").first,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                              Text(
                                "RED CARDS",
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6!
                                    .copyWith(color: primaryColor),
                              ),
                              Text(
                                state.data.data.redCards.split(":").last,
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (state is MatchdetailsErrorState) {
                  return Center(child: Text(state.message));
                } else {
                  return const SizedBox();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
