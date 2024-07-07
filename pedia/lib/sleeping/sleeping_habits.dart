import 'package:flutter/material.dart';
import 'package:pedia/models/sleeping_data.dart';
import 'package:pedia/sleeping/sleeping_choice.dart';
import 'package:pedia/gradient_scaffold.dart';
import 'package:pedia/sleeping/sleeping_result.dart';

class SleepingHabits extends StatefulWidget {
  const SleepingHabits({super.key});

  @override
  _SleepingHabitsState createState() => _SleepingHabitsState();
}

class _SleepingHabitsState extends State<SleepingHabits> {
  SleepingData sleepingData = SleepingData();

  void _openChoiceOverlay(Category category) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => SleepingChoice(category: category),
    );

    if (result != null) {
      setState(() {
        sleepingData.choices[category] = result;
      });
      debugPrint('Selected Option for ${categoryNames[category.index]}: $result');

      if (_allCategoriesSelected()) {
        _showSleepingResultScreen();
      }
    }
  }

  bool _allCategoriesSelected() {
    for (var category in Category.values) {
      if (!sleepingData.choices.containsKey(category) ||
          sleepingData.choices[category] == '') {
        return false;
      }
    }
    return true;
  }

  void _showSleepingResultScreen() {
    int totalScore = sleepingData.calculatedSleepingScore;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SleepingResult(sleepingScore: totalScore),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16, 3, 16, 3),
              child: ListView.builder(
                itemCount: categoryNames.length,
                itemBuilder: (context, index) {
                  final category = Category.values[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: InkWell(
                      onTap: () {
                        _openChoiceOverlay(category);
                      },
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        color: sleepingData.choices[category] != null ? Colors.green : Colors.red,
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              categoryNames[index],
                              style: const TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
