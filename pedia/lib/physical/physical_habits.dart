import 'package:flutter/material.dart';
import 'package:pedia/models/physical_data.dart';
import 'package:pedia/physical/physical_choice.dart';
import 'package:pedia/gradient_scaffold.dart';
import 'package:pedia/physical/physical_result.dart';

class PhysicalHabits extends StatefulWidget {
  const PhysicalHabits({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PhysicalHabitsState();
  }
}

class _PhysicalHabitsState extends State<PhysicalHabits> {
  PhysicalData physicalData = PhysicalData();

  void _openChoiceOverlay(Category category) async {
    final result = await showModalBottomSheet<String>(
      context: context,
      isScrollControlled: true,
      builder: (ctx) => PhysicalChoice(category: category),
    );

    if (result != null) {
      setState(() {
        physicalData.choices[category] = result;
      });
      debugPrint('Selected Option for ${categoryNames[category.index]}: $result');

      if (_allCategoriesSelected()) {
        _showPhysicalResultScreen();
      }
    }
  }

  bool _allCategoriesSelected() {
    for (var category in Category.values) {
      if (!physicalData.choices.containsKey(category) ||
          physicalData.choices[category] == '') {
        return false;
      }
    }
    return true;
  }

  void _showPhysicalResultScreen() {
    int totalScore = physicalData.calculatedPhysicalScore;

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PhysicalResult(physicalScore: totalScore),
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
              "Physical Habits",
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
                        color: physicalData.choices[category] != null ? Colors.green : Colors.red,
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
