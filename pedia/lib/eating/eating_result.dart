import 'package:flutter/material.dart';

class EatingResult extends StatelessWidget {
  final int eatingScore;
  const EatingResult({required this.eatingScore,super.key});

  String get resultMessage {
    if (eatingScore >= 0 && eatingScore <= 25) {
      return 'Low Risk';
    } else if (eatingScore >= 26 && eatingScore <= 40) {
      return 'High Risk';
    } else {
      return 'Unknown'; // Handle unexpected score ranges
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Eating Habits Result'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Overall Score: $eatingScore',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              'Risk Level: $resultMessage',
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Navigate back to the previous screen
              },
              child: const Text('Return to Main Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
