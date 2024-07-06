import 'package:flutter/material.dart';
import 'package:pedia/models/sedentary_data.dart';
import 'package:pedia/sedentary/sedentary_choice.dart';
import 'package:pedia/gradient_scaffold.dart';
import 'package:pedia/sedentary/sedentary_result.dart';

class SedentaryHabits extends StatefulWidget {
  const SedentaryHabits({super.key});

  @override
  _SedentaryHabitsState createState() => _SedentaryHabitsState();
}

class _SedentaryHabitsState extends State<SedentaryHabits> {
  SedentaryData sedentaryData = SedentaryData();

  void _openChoiceOverlay(Category category) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => SedentaryChoice(category: category),
    );

    if (result != null) {
      setState(() {
        sedentaryData.choices[category] = result;
      });
      debugPrint('Selected Option for ${categoryNames[category.index]}: $result');

      if (_allCategoriesSelected()) {
        _showSedentaryResultScreen();
      }
    }
  }

  bool _allCategoriesSelected() {
    for (var category in Category.values) {
      if (!sedentaryData.choices.containsKey(category) ||
          sedentaryData.choices[category] == '') {
        return false;
      }
    }
    return true;
  }

  void _showSedentaryResultScreen() {
    int totalScore = sedentaryData.calculatedSedentaryScore;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => SedentaryResult(sedentaryScore: totalScore),
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
                        color: sedentaryData.choices[category] != null ? Colors.green : Colors.red,
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