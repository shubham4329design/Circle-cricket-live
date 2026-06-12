import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PointsTableScreen extends ConsumerWidget {
  final String tournamentId;

  const PointsTableScreen({
    required this.tournamentId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Points Table'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Table Header
          Card(
            color: Theme.of(context).primaryColor,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: _HeaderCell('#', isHeader: true),
                  ),
                  Expanded(
                    flex: 3,
                    child: _HeaderCell('Team', isHeader: true),
                  ),
                  Expanded(
                    flex: 1,
                    child: _HeaderCell('P', isHeader: true),
                  ),
                  Expanded(
                    flex: 1,
                    child: _HeaderCell('W', isHeader: true),
                  ),
                  Expanded(
                    flex: 1,
                    child: _HeaderCell('L', isHeader: true),
                  ),
                  Expanded(
                    flex: 1,
                    child: _HeaderCell('Pts', isHeader: true),
                  ),
                  Expanded(
                    flex: 1,
                    child: _HeaderCell('NRR', isHeader: true),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 8),

          // Table Rows (Mock Data)
          ..._mockTeams
              .asMap()
              .entries
              .map((entry) {
                int index = entry.key + 1;
                var team = entry.value;
                return _TableRow(
                  position: index,
                  teamName: team['name'],
                  played: team['played'],
                  won: team['won'],
                  lost: team['lost'],
                  points: team['points'],
                  nrr: team['nrr'],
                );
              })
              .toList()
              .cast<Widget>()
              .expand(
                (element) => [element, const SizedBox(height: 4)],
              )
              .toList(),
        ],
      ),
    );
  }

  static final _mockTeams = [
    {
      'name': 'Team A',
      'played': 5,
      'won': 4,
      'lost': 1,
      'points': 8,
      'nrr': 0.45
    },
    {
      'name': 'Team B',
      'played': 5,
      'won': 3,
      'lost': 2,
      'points': 6,
      'nrr': 0.12
    },
    {
      'name': 'Team C',
      'played': 5,
      'won': 3,
      'lost': 2,
      'points': 6,
      'nrr': -0.05
    },
    {
      'name': 'Team D',
      'played': 5,
      'won': 2,
      'lost': 3,
      'points': 4,
      'nrr': -0.20
    },
    {
      'name': 'Team E',
      'played': 5,
      'won': 0,
      'lost': 5,
      'points': 0,
      'nrr': -0.32
    },
  ];
}

class _HeaderCell extends StatelessWidget {
  final String text;
  final bool isHeader;

  const _HeaderCell(this.text, {this.isHeader = false});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: isHeader ? Colors.white : Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 12,
      ),
    );
  }
}

class _TableRow extends StatelessWidget {
  final int position;
  final String teamName;
  final int played;
  final int won;
  final int lost;
  final int points;
  final double nrr;

  const _TableRow({
    required this.position,
    required this.teamName,
    required this.played,
    required this.won,
    required this.lost,
    required this.points,
    required this.nrr,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      '$position',
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                teamName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(child: Text('$played')),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  '$won',
                  style: const TextStyle(color: Colors.green),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  '$lost',
                  style: const TextStyle(color: Colors.red),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  '$points',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  nrr.toStringAsFixed(2),
                  style: TextStyle(
                    color: nrr > 0 ? Colors.green : Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
