import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  final int totalConnections;
  final int successfulConnections;
  final int failedConnections;

  StatisticsPage({
    required this.totalConnections,
    required this.successfulConnections,
    required this.failedConnections,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mes statistiques📉'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Mes Connexions: $totalConnections'),
            Text('Connexions réussies: $successfulConnections'),
            Text('Echec de connexions: $failedConnections'),
          ],
        ),
      ),
    );
  }
}

