class TableModel {
  final List<Standing> standings;

  TableModel(this.standings);
  factory TableModel.fromJson(Map<String, dynamic> json) => TableModel(
        List<Standing>.from(
          json['standings'].map(
            (x) => Standing.fromJson(x),
          ),
        ),
      );
}

class Standing {
  final String group;
  final List<Table> table;

  Standing(this.group, this.table);

  factory Standing.fromJson(Map<String, dynamic> json) => Standing(
        json['group'],
        List<Table>.from(
          json['table'].map(
            (x) => Table.fromJson(x),
          ),
        ),
      );
}

class Table {
  final int position;
  final Team team;
  final int playedGames;
  final int won;
  final int draw;
  final int lost;
  final int goalDifference;
  final int points;

  Table(this.position, this.team, this.playedGames, this.won, this.draw,
      this.lost, this.goalDifference, this.points);
  factory Table.fromJson(Map<String, dynamic> json) => Table(
      json["position"],
      Team.fromJson(json["team"]),
      json['playedGames'],
      json["won"],
      json['draw'],
      json['lost'],
      json['goalDifference'],
      json['points']);
}

class Team {
  final String name;
  final String tla;
  final String image;

  Team(this.name, this.tla, this.image);
  factory Team.fromJson(Map<String, dynamic> json) =>
      Team(json["name"], json["tla"], json["crest"]);
}
