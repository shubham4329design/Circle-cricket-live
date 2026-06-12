class PointsTableModel {
  final String teamId;
  final int played;
  final int won;
  final int lost;
  final int tied;
  final int points;
  final double nrr;
  final int forRuns;
  final double forOvers;
  final int againstRuns;
  final double againstOvers;

  PointsTableModel({
    required this.teamId,
    this.played = 0,
    this.won = 0,
    this.lost = 0,
    this.tied = 0,
    this.points = 0,
    this.nrr = 0.0,
    this.forRuns = 0,
    this.forOvers = 0.0,
    this.againstRuns = 0,
    this.againstOvers = 0.0,
  });

  PointsTableModel copyWith({
    String? teamId,
    int? played,
    int? won,
    int? lost,
    int? tied,
    int? points,
    double? nrr,
    int? forRuns,
    double? forOvers,
    int? againstRuns,
    double? againstOvers,
  }) {
    return PointsTableModel(
      teamId: teamId ?? this.teamId,
      played: played ?? this.played,
      won: won ?? this.won,
      lost: lost ?? this.lost,
      tied: tied ?? this.tied,
      points: points ?? this.points,
      nrr: nrr ?? this.nrr,
      forRuns: forRuns ?? this.forRuns,
      forOvers: forOvers ?? this.forOvers,
      againstRuns: againstRuns ?? this.againstRuns,
      againstOvers: againstOvers ?? this.againstOvers,
    );
  }

  Map<String, dynamic> toFirestore() => {
        'teamId': teamId,
        'played': played,
        'won': won,
        'lost': lost,
        'tied': tied,
        'points': points,
        'nrr': nrr,
        'forRuns': forRuns,
        'forOvers': forOvers,
        'againstRuns': againstRuns,
        'againstOvers': againstOvers,
      };

  factory PointsTableModel.fromFirestore(Map<String, dynamic> data) {
    return PointsTableModel(
      teamId: data['teamId'] ?? '',
      played: data['played'] ?? 0,
      won: data['won'] ?? 0,
      lost: data['lost'] ?? 0,
      tied: data['tied'] ?? 0,
      points: data['points'] ?? 0,
      nrr: (data['nrr'] ?? 0.0).toDouble(),
      forRuns: data['forRuns'] ?? 0,
      forOvers: (data['forOvers'] ?? 0.0).toDouble(),
      againstRuns: data['againstRuns'] ?? 0,
      againstOvers: (data['againstOvers'] ?? 0.0).toDouble(),
    );
  }
}
