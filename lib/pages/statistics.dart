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
        title: Text('Statistics'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Total Connections: $totalConnections'),
            Text('Successful Connections: $successfulConnections'),
            Text('Failed Connections: $failedConnections'),
          ],
        ),
      ),
    );
  }
}
