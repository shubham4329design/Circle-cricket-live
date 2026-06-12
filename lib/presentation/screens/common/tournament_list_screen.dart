import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TournamentListScreen extends ConsumerWidget {
  const TournamentListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // In real app, this would use tournamentProvider
    final tournaments = _mockTournaments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Tournaments'),
        centerTitle: true,
      ),
      body: tournaments.isEmpty
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.sports_cricket,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'No tournaments yet',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            )
          : ListView(
              padding: const EdgeInsets.all(16),
              children: [
                // Filter Chips
                Wrap(
                  spacing: 8,
                  children: ['All', 'Upcoming', 'Ongoing', 'Completed']
                      .map(
                        (status) => FilterChip(
                          label: Text(status),
                          onSelected: (selected) {},
                        ),
                      )
                      .toList(),
                ),
                const SizedBox(height: 16),

                // Tournament List
                ...tournaments.map((tournament) => _TournamentListItem(
                  tournament: tournament,
                  onTap: () {},
                )),
              ],
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
    );
  }

  static final _mockTournaments = [
    {
      'name': 'Summer League 2026',
      'status': 'upcoming',
      'startDate': '2026-07-01',
      'teams': 8,
      'matches': 14,
    },
    {
      'name': 'City Championship',
      'status': 'ongoing',
      'startDate': '2026-06-12',
      'teams': 6,
      'matches': 10,
    },
    {
      'name': 'Winter Cup 2025',
      'status': 'completed',
      'startDate': '2025-12-01',
      'teams': 10,
      'matches': 18,
    },
  ];
}

class _TournamentListItem extends StatelessWidget {
  final Map<String, dynamic> tournament;
  final VoidCallback onTap;

  const _TournamentListItem({
    required this.tournament,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final status = tournament['status'] as String;
    final statusColor = _getStatusColor(status);

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: statusColor.withOpacity(0.2),
          child: Icon(
            Icons.sports_cricket,
            color: statusColor,
          ),
        ),
        title: Text(
          tournament['name'],
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          '${tournament['teams']} teams • ${tournament['matches']} matches',
          style: TextStyle(fontSize: 12, color: Colors.grey[600]),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.2),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                status.toUpperCase(),
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: statusColor,
                ),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              tournament['startDate'],
              style: TextStyle(fontSize: 10, color: Colors.grey[500]),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }

  Color _getStatusColor(String status) {
    switch (status) {
      case 'upcoming':
        return Colors.blue;
      case 'ongoing':
        return Colors.orange;
      case 'completed':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
