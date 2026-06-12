import 'package:flutter/material.dart';

class MatchHighlightsScreen extends StatelessWidget {
  final String matchId;

  const MatchHighlightsScreen({
    required this.matchId,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final highlights = [
      {
        'title': '6 SIXES by Batsman A',
        'description': 'Amazing batting display',
        'time': '12:30 PM',
      },
      {
        'title': 'Hat-trick by Bowler B',
        'description': 'Three consecutive wickets',
        'time': '1:15 PM',
      },
      {
        'title': 'Century by Batsman C',
        'description': '100 runs achieved',
        'time': '2:45 PM',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Match Highlights'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ...highlights
              .map(
                (highlight) => Card(
                  margin: const EdgeInsets.only(bottom: 12),
                  child: ListTile(
                    leading: Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.highlight,
                        color: Colors.orange,
                      ),
                    ),
                    title: Text(
                      highlight['title']!,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 4),
                        Text(highlight['description']!),
                        const SizedBox(height: 4),
                        Text(
                          highlight['time']!,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    trailing: const Icon(Icons.arrow_forward),
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}
