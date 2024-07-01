import 'package:flutter/material.dart';
import 'package:pedia/eating_choice.dart';
import 'package:pedia/models/eating_data.dart';
import 'package:pedia/gradient_scaffold.dart';

class EatingHabits extends StatefulWidget {
  const EatingHabits({super.key});
  @override
  State<StatefulWidget> createState() {
    return _EatingHabitsState();
  }
}
class _EatingHabitsState extends State<EatingHabits> {
  void _openChoiceOverlay(){
    showModalBottomSheet(context: context, builder: (ctx)=>
      const EatingChoice()
    );
  }
  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: SingleChildScrollView(
        child: Column(
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
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 3, 16, 3),
              child: Column(
                children: List.generate(categoryNames.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 2),
                    child: InkWell(
                      onTap: () => _openChoiceOverlay(),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 4,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Center(
                            child: Text(categoryNames[index]),
                          ),
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
