class StatsModel {
  final StatsData data;

  StatsModel(this.data);
  factory StatsModel.fromJson(Map<String, dynamic> json) =>
      StatsModel(StatsData.fromJson(json['data']));
}

class StatsData {
  final String yellowCards;
  final String redCards;
  final String possesion;
  final String offsides;
  final String corners;
  final String shotsonTarget;
  final String shotsoffTarget;
  final String fauls;
  final String penalties;

  StatsData(this.yellowCards, this.redCards, this.possesion, this.offsides,
      this.corners, this.shotsonTarget, this.shotsoffTarget, this.fauls, this.penalties);
  factory StatsData.fromJson(Map<String, dynamic> json) => StatsData(
      json['yellow_cards'],
      json['red_cards'],
      json['possesion'],
      json['offsides'],
      json['corners'],
      json['shots_on_target'],
      json['attempts_on_goal'],
      json['fauls'],
      json['penalties']??"0:0");
}
