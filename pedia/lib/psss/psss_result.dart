import 'package:flutter/material.dart';
import 'package:pedia/home_page.dart';
import 'package:pedia/psss/psss_habits.dart';
import 'package:pedia/database_helper.dart';
import 'package:pedia/questions_screen.dart';

class PsssResult extends StatelessWidget {
  final int score;
  final int habitType;
  final DatabaseHelper dbHelper;

  const PsssResult({
    super.key,
    required this.score,
    required this.habitType,
    required this.dbHelper,
  });

  @override
  Widget build(BuildContext context) {
    String resultTitle;
    switch (habitType) {
      case 0:
        resultTitle = 'Physical Activity Result';
        break;
      case 1:
        resultTitle = 'Sedentary Habits Result';
        break;
      case 2:
        resultTitle = 'Sedentary Habits Two Result';
        break;
      case 3:
        resultTitle = 'Sleeping Habits Result';
        break;
      default:
        resultTitle = 'Result';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(resultTitle),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Your score is: $score', 
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      if (habitType == 0) {
                        return PsssHabits(habitType: 1, dbHelper: dbHelper);
                      } else if (habitType == 1) {
                        return QuestionsScreen(startIndex: 15, endIndex: 17, dbHelper: dbHelper);
                      } else if (habitType == 2) {
                        return QuestionsScreen(startIndex: 18, endIndex: 19, dbHelper: dbHelper);
                      } else {
                        return HomePage(dbHelper: dbHelper);
                      }
                    },
                  ),
                );
              },
              icon: const Icon(Icons.arrow_forward),
              label: const Text('Next'),
            ),
          ],
        ),
      ),
    );
  }
}
