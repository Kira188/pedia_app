import 'package:flutter/material.dart';
import 'package:pedia/gradient_scaffold.dart';
import 'package:pedia/database_helper.dart';
import 'package:pedia/questions_screen.dart';

class EatingResult extends StatelessWidget {
  final int eatingScore;
  final DatabaseHelper dbHelper;

  const EatingResult({super.key, required this.eatingScore, required this.dbHelper});

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      showBackButton: false, // Turn off back button
      appBarText: "Eating Habits Result",
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your Eating Score is: $eatingScore",
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 50),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return QuestionsScreen(
                    startIndex: 11,
                    endIndex: 14,
                    dbHelper: dbHelper,
                  );
                }));
              },
              child: Card(
                color: const Color.fromARGB(255, 238, 198, 150),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 5,
                child: const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      "OK",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
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
