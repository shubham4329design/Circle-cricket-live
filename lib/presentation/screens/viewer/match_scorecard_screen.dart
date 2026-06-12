import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MatchScoreboardScreen extends ConsumerWidget {
  final String matchId;

  const MatchScoreboardScreen({
    required this.matchId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Live Scorecard'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Teams Score
          Row(
            children: [
              Expanded(
                child: _TeamScoreCard(
                  teamName: 'Team A',
                  runs: 145,
                  wickets: 3,
                  overs: 15.4,
                  isActive: true,
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: _TeamScoreCard(
                  teamName: 'Team B',
                  runs: 89,
                  wickets: 6,
                  overs: 12.2,
                  isActive: false,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),

          // Current Batsmen
          const Text(
            'Current Batsmen',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _BatsmanCard(
            name: 'Player 1',
            runs: 34,
            balls: 28,
            fours: 3,
            sixes: 1,
            isSriker: true,
          ),
          const SizedBox(height: 8),
          _BatsmanCard(
            name: 'Player 2',
            runs: 12,
            balls: 18,
            fours: 1,
            sixes: 0,
            isSriker: false,
          ),
          const SizedBox(height: 24),

          // Current Bowler
          const Text(
            'Current Bowler',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _BowlerCard(
            name: 'Bowler A',
            overs: 4.2,
            runs: 28,
            wickets: 1,
          ),
          const SizedBox(height: 24),

          // Last 6 Deliveries
          const Text(
            'Last 6 Deliveries',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _DeliveryBall(value: '0'),
              _DeliveryBall(value: '4'),
              _DeliveryBall(value: '1'),
              _DeliveryBall(value: 'W'),
              _DeliveryBall(value: '2'),
              _DeliveryBall(value: '6'),
            ],
          ),
        ],
      ),
    );
  }
}

class _TeamScoreCard extends StatelessWidget {
  final String teamName;
  final int runs;
  final int wickets;
  final double overs;
  final bool isActive;

  const _TeamScoreCard({
    required this.teamName,
    required this.runs,
    required this.wickets,
    required this.overs,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: isActive ? 4 : 2,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: isActive
              ? Border.all(color: Colors.green, width: 2)
              : Border.all(color: Colors.grey[300]!),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  teamName,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (isActive)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      'Batting',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '$runs/$wickets',
              style: const TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              '$overs overs',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BatsmanCard extends StatelessWidget {
  final String name;
  final int runs;
  final int balls;
  final int fours;
  final int sixes;
  final bool isSriker;

  const _BatsmanCard({
    required this.name,
    required this.runs,
    required this.balls,
    required this.fours,
    required this.sixes,
    required this.isSriker,
  });

  @override
  Widget build(BuildContext context) {
    final strikeRate = (runs / (balls > 0 ? balls : 1) * 100).toStringAsFixed(1);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                if (isSriker)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: const Text(
                      '✶',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _StatChip('Runs', '$runs'),
                _StatChip('Balls', '$balls'),
                _StatChip('4s', '$fours'),
                _StatChip('6s', '$sixes'),
                _StatChip('SR', strikeRate),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatChip extends StatelessWidget {
  final String label;
  final String value;

  const _StatChip(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class _BowlerCard extends StatelessWidget {
  final String name;
  final double overs;
  final int runs;
  final int wickets;

  const _BowlerCard({
    required this.name,
    required this.overs,
    required this.runs,
    required this.wickets,
  });

  @override
  Widget build(BuildContext context) {
    final economy = (runs / (overs > 0 ? overs : 1)).toStringAsFixed(2);

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                _BowlerStat('O', '${overs.toStringAsFixed(1)}'),
                const SizedBox(width: 16),
                _BowlerStat('R', '$runs'),
                const SizedBox(width: 16),
                _BowlerStat('W', '$wickets'),
                const SizedBox(width: 16),
                _BowlerStat('Eco', economy),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BowlerStat extends StatelessWidget {
  final String label;
  final String value;

  const _BowlerStat(this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          label,
          style: TextStyle(
            fontSize: 10,
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }
}

class _DeliveryBall extends StatelessWidget {
  final String value;

  const _DeliveryBall({required this.value});

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor = Colors.white;

    switch (value) {
      case '0':
        backgroundColor = Colors.grey;
        break;
      case '1':
      case '2':
      case '3':
        backgroundColor = Colors.blue;
        break;
      case '4':
        backgroundColor = Colors.green;
        break;
      case '6':
        backgroundColor = Colors.red;
        break;
      case 'W':
        backgroundColor = Colors.black;
        break;
      default:
        backgroundColor = Colors.grey;
    }

    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: backgroundColor,
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          value,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
