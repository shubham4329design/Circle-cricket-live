import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayerStatsScreen extends ConsumerWidget {
  final String playerId;

  const PlayerStatsScreen({
    required this.playerId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mockPlayer = {
      'name': 'Virat Kohli',
      'team': 'Team A',
      'role': 'Batsman',
      'matches': 25,
      'runs': 1250,
      'average': 50.0,
      'strikeRate': 145.5,
      'fours': 85,
      'sixes': 12,
      'wickets': 0,
      'economy': 0.0,
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Statistics'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Player Header
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: Colors.grey[300],
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    mockPlayer['name'],
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    mockPlayer['role'],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    mockPlayer['team'],
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.blue[600],
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Batting Stats
          const Text(
            'Batting Statistics',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),
          _StatGrid(
            stats: [
              {'label': 'Matches', 'value': '${mockPlayer['matches']}'},
              {'label': 'Runs', 'value': '${mockPlayer['runs']}'},
              {'label': 'Average', 'value': '${mockPlayer['average']}'},
              {'label': 'Strike Rate', 'value': '${mockPlayer['strikeRate']}'},
              {'label': 'Fours', 'value': '${mockPlayer['fours']}'},
              {'label': 'Sixes', 'value': '${mockPlayer['sixes']}'},
            ],
          ),
          const SizedBox(height: 24),

          // Bowling Stats (if applicable)
          if (mockPlayer['wickets'] != 0)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Bowling Statistics',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                _StatGrid(
                  stats: [
                    {'label': 'Wickets', 'value': '${mockPlayer['wickets']}'},
                    {'label': 'Economy', 'value': '${mockPlayer['economy']}'},
                  ],
                ),
              ],
            ),
        ],
      ),
    );
  }
}

class _StatGrid extends StatelessWidget {
  final List<Map<String, String>> stats;

  const _StatGrid({required this.stats});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 12,
      crossAxisSpacing: 12,
      children: stats
          .map(
            (stat) => Card(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      stat['value']!,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      stat['label']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
          .toList(),
    );
  }
}
