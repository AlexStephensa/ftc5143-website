// lib/views/home_view.dart

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:xcentrics/widgets/centered_view/centered_view.dart';
import 'package:xcentrics/widgets/navagation_Bar/navagation_bar.dart';

class ScoutingHomeView extends StatelessWidget {
  const ScoutingHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          brightness: Brightness.dark,
        ),
      ),
      child: Scaffold(
        backgroundColor: const Color(0xFF121212),
        body: CenteredView(
          child: Column(
            children: [
              NavagationBar(),
              Expanded(
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'FTC Team 5143',
                        style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      const SizedBox(height: 8),
                      const Text(
                        'Select a scouting mode to get started.',
                        style: TextStyle(fontSize: 15, color: Colors.white54),
                      ),
                      const SizedBox(height: 48),
                      _DashboardCard(
                        icon: Icons.sports_soccer,
                        title: 'Match Scouting',
                        description: 'Record auto, teleop, and endgame performance.',
                        onTap: () => context.go('/match-scouting'),
                      ),
                      const SizedBox(height: 16),
                      _DashboardCard(
                        icon: Icons.build,
                        title: 'Pit Scouting',
                        description: 'Record robot specs and capabilities.',
                        onTap: () => context.go('/pit-scouting'),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _DashboardCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final VoidCallback onTap;

  const _DashboardCard({
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 320,
      child: Card(
        color: const Color(0xFF1E1E1E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
          side: const BorderSide(color: Colors.white12),
        ),
        elevation: 4,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Row(
              children: [
                Icon(icon, size: 40, color: Colors.white),
                const SizedBox(width: 20),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                      const SizedBox(height: 4),
                      Text(description,
                          style: const TextStyle(
                              fontSize: 13, color: Colors.white54)),
                    ],
                  ),
                ),
                const Icon(Icons.chevron_right, color: Colors.white38),
              ],
            ),
          ),
        ),
      ),
    );
  }
}