class UpcomingMatchModel {
  final UpcomingMatchData data;

  UpcomingMatchModel(this.data);
  factory UpcomingMatchModel.fromJson(Map<String, dynamic> json) =>
      UpcomingMatchModel(UpcomingMatchData.fromJson(json['data']));
}

class UpcomingMatchData {
  final List<Fixtures> fixtures;

  UpcomingMatchData(this.fixtures);
  factory UpcomingMatchData.fromJson(Map<String, dynamic> json) =>
      UpcomingMatchData(
        List<Fixtures>.from(
          json["fixtures"].map(
            (x) => Fixtures.fromJson(x),
          ),
        ),
      );
}

class Fixtures {
  final String location;
  final int id;
  final String status;
  final String date;
  final String homeName;
  final String ftScore;
  final String awayName;
  final String time;
  Fixtures({
    required this.location,
    required this.id,
    required this.status,
    required this.date,
    required this.homeName,
    required this.ftScore,
    required this.awayName,
    required this.time,
  });

  factory Fixtures.fromJson(Map<String, dynamic> json) => Fixtures(
        location: json['location'] ?? "",
        id: json['id'],
        status: json['status']??"",
        date: json['date']??"",
        homeName: json['home_name'] ?? "",
        ftScore: json['ft_score']??"-:-",
        awayName: json['away_name'] ?? "",
        time: json['time'] ?? "",
      );
}
