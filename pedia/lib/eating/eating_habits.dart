import 'package:flutter/material.dart';
import 'package:pedia/eating/eating_choice.dart';
import 'package:pedia/models/eating_model.dart';
import 'package:pedia/gradient_scaffold.dart';
import 'package:pedia/eating/eating_result.dart';

class EatingHabits extends StatefulWidget {
  const EatingHabits({super.key});

  @override
  State<StatefulWidget> createState() {
    return _EatingHabitsState();
  }
}

class _EatingHabitsState extends State<EatingHabits> {
  EatingModel eatingData = EatingModel();

  void _openChoiceOverlay(Category category) async {
    final result = await showModalBottomSheet<Map<int, String>>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => EatingChoice(category: category),
    );

    if (result != null) {
      setState(() {
        eatingData.choices[category] = result;
      });
      debugPrint('Selected Options for ${categoryNames[category.index]}: $result');

      // Check if all categories have been selected
      if (_allCategoriesSelected()) {
        // All categories are selected, perform action here
        _showEatingResultScreen();
      }
    }
  }

  bool _allCategoriesSelected() {
    for (var category in Category.values) {
      if (!eatingData.choices.containsKey(category) ||
          eatingData.choices[category]!.values.any((frequency) => false)) {
        return false;
      }
    }
    return true;
  }

  void _showEatingResultScreen() {
    // Calculate total score here if needed
    int totalScore = eatingData.calculatedEatingScore;

    // Navigate to the EatingResult screen with calculated score
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EatingResult(eatingScore: totalScore),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  "lib/assets/aher-logo.jpeg",
                  width: 80,
                ),
                Image.asset(
                  "lib/assets/jss logo.jpg",
                  width: 80,
                ),
              ],
            ),
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 0),
              child: Text(
                "Pedia Predict",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              "Eating Habits",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ),
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
                        color: eatingData.choices[category] != null ? Colors.green : Colors.red,
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(
                              categoryNames[index],
                              style: const TextStyle(color: Colors.white), // To ensure text is readable on both red and green background
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
