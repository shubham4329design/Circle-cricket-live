import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../presentation/providers/tournament_provider.dart';
import '../../../presentation/widgets/tournament_card.dart';

class TournamentDashboardScreen extends ConsumerWidget {
  final String tournamentId;

  const TournamentDashboardScreen({
    required this.tournamentId,
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tournamentDetail = ref.watch(tournamentDetailProvider(tournamentId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Tournament Details'),
      ),
      body: tournamentDetail.when(
        data: (tournament) {
          if (tournament == null) {
            return const Center(child: Text('Tournament not found'));
          }
          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Tournament Header
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        tournament.name,
                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            size: 16,
                            color: Colors.grey[600],
                          ),
                          const SizedBox(width: 4),
                          Text(
                            tournament.type.toUpperCase(),
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Tournament Info
              _TournamentInfoCard(
                icon: Icons.calendar_month,
                title: 'Start Date',
                value: tournament.startDate.toString().split(' ')[0],
              ),
              const SizedBox(height: 12),
              _TournamentInfoCard(
                icon: Icons.event_note,
                title: 'End Date',
                value: tournament.endDate.toString().split(' ')[0],
              ),
              const SizedBox(height: 12),
              _TournamentInfoCard(
                icon: Icons.circle,
                title: 'Boundary Radius',
                value: '${tournament.boundaryRadiusFeet} feet',
              ),
              const SizedBox(height: 12),
              _TournamentInfoCard(
                icon: Icons.money,
                title: 'Entry Fee',
                value: '₹${tournament.entryFee}',
              ),
              const SizedBox(height: 16),

              // Matches Section
              const Text(
                'Matches',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 12),
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey[300]!),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text('Matches will appear here'),
              ),
            ],
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }
}

class _TournamentInfoCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _TournamentInfoCard({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Row(
          children: [
            Icon(icon, color: Theme.of(context).primaryColor),
            const SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.grey[600],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
