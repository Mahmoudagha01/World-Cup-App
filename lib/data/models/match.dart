class MatchModel {
  final MatchData data;

  MatchModel(this.data);
  factory MatchModel.fromJson(Map<String, dynamic> json) =>
      MatchModel(MatchData.fromJson(json['data']));
}

class MatchData {
  final List<Match> match;

  MatchData(this.match);
  factory MatchData.fromJson(Map<String, dynamic> json) => MatchData(
        List<Match>.from(
          json["match"].map(
            (x) => Match.fromJson(x),
          ),
        ),
      );
}

class Match {
  final String location;
  final int id;
  final String status;
  final String date;
  final String homeName;
  final String ftScore;
  final String awayName;
  Match({
    required this.location,
    required this.id,
    required this.status,
    required this.date,
    required this.homeName,
    required this.ftScore,
    required this.awayName,
  });

  factory Match.fromJson(Map<String, dynamic> json) => Match(
      location: json['location']??"",
      id: json['id'],
      status: json['status'],
      date: json['date'],
      homeName: json['home_name']??"",
      ftScore: json['ft_score'],
      awayName: json['away_name']??"");
}
