import 'package:flutter/material.dart';
import 'package:pedia/gradient_scaffold.dart';
import 'package:pedia/image_question.dart';
import 'package:pedia/psss/psss_habits.dart';
import 'package:pedia/utils/database_helper.dart';
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

    return GradientScaffold(
      appBarText: resultTitle,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Your score is: $score',
                style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton.icon(
                onPressed: () {
                  if (habitType == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PsssHabits(habitType: 1, dbHelper: dbHelper),
                      ),
                    );
                  } else if (habitType == 1) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuestionsScreen(startIndex: 16, endIndex: 18, dbHelper: dbHelper),
                      ),
                    );
                  } else if (habitType == 2) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ImageQuestion(dbHelper: dbHelper),
                      ),
                    );
                  } else {
                    Navigator.popUntil(
                      context,
                      (route) => route.isFirst,
                    );
                  }
                },
                icon: const Icon(Icons.arrow_forward),
                label: const Text('Next'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
