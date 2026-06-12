import 'package:flutter_test/flutter_test.dart';
import 'package:circle_cricket_live/utils/calculator.dart';
import 'package:circle_cricket_live/data/models/points_table_model.dart';

void main() {
  group('PointsTableCalculator Tests', () {
    late PointsTableModel testEntry;

    setUp(() {
      testEntry = PointsTableModel(
        teamId: 'team-1',
        played: 5,
        won: 3,
        lost: 2,
        tied: 0,
        points: 6,
        nrr: 0.25,
        forRuns: 450,
        forOvers: 50.0,
        againstRuns: 400,
        againstOvers: 50.0,
      );
    });

    test('Update entry with win', () {
      final updated = PointsTableCalculator.updateEntry(
        current: testEntry,
        won: true,
        tied: false,
        runsFor: 150,
        oversFor: 20.0,
        runsAgainst: 120,
        oversAgainst: 20.0,
      );

      expect(updated.played, 6);
      expect(updated.won, 4);
      expect(updated.points, 8);
    });

    test('Update entry with tie', () {
      final updated = PointsTableCalculator.updateEntry(
        current: testEntry,
        won: false,
        tied: true,
        runsFor: 150,
        oversFor: 20.0,
        runsAgainst: 150,
        oversAgainst: 20.0,
      );

      expect(updated.tied, 1);
      expect(updated.points, 7);
    });

    test('Calculate NRR correctly', () {
      final updated = PointsTableCalculator.updateEntry(
        current: testEntry,
        won: true,
        tied: false,
        runsFor: 100,
        oversFor: 20.0,
        runsAgainst: 80,
        oversAgainst: 20.0,
      );

      final expectedNRR = ((450 + 100) / 70.0) - ((400 + 80) / 70.0);
      expect(updated.nrr, closeTo(expectedNRR, 0.01));
    });

    test('Sort by points and NRR', () {
      final entries = [
        PointsTableModel(
          teamId: 'team-1',
          points: 6,
          nrr: 0.25,
        ),
        PointsTableModel(
          teamId: 'team-2',
          points: 6,
          nrr: 0.30,
        ),
        PointsTableModel(
          teamId: 'team-3',
          points: 8,
          nrr: -0.10,
        ),
      ];

      final sorted = PointsTableCalculator.sortByPoints(entries);

      expect(sorted[0].teamId, 'team-3'); // Highest points
      expect(sorted[1].teamId, 'team-2'); // Same points, higher NRR
      expect(sorted[2].teamId, 'team-1');
    });
  });
}
