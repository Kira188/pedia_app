import 'package:flutter/material.dart';
import 'package:pedia/data/questions_data.dart';
import 'package:pedia/home_page.dart';
import 'package:pedia/models/questions_model.dart';
import 'package:pedia/gradient_scaffold.dart';
import 'package:pedia/database_helper.dart';
import 'package:pedia/eating/eating_habits.dart';
import 'package:pedia/psss/psss_habits.dart';

class QuestionsScreen extends StatefulWidget {
  final int startIndex;
  final int endIndex;
  final DatabaseHelper dbHelper;

  const QuestionsScreen({
    super.key,
    required this.startIndex,
    required this.endIndex,
    required this.dbHelper,
  });

  @override
  State<StatefulWidget> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final Map<String, String> textAnswers = {};
  final Map<String, String> dropdownAnswers = {};
  final Set<String> expandedQuestions = {};

  @override
  void initState() {
    super.initState();
    textAnswers.clear();
    dropdownAnswers.clear();
  }

  void handleDropdownAnswerChange(String questionKey, String? answer) {
    setState(() {
      dropdownAnswers[questionKey] = answer!;
      if (answer == 'Yes') {
        expandedQuestions.add(questionKey);
      } else {
        expandedQuestions.remove(questionKey);
      }
    });
  }

  void handleTextAnswerChange(String questionKey, String answer) {
    setState(() {
      textAnswers[questionKey] = answer;
    });
  }

  Future<void> saveAnswers() async {
    int latestSdcId = await widget.dbHelper.getLatestSdcId();

    for (var entry in textAnswers.entries) {
      await widget.dbHelper.insertSdcQuestion(latestSdcId, entry.key, entry.value);
    }

    for (var entry in dropdownAnswers.entries) {
      await widget.dbHelper.insertSdcQuestion(latestSdcId, entry.key, entry.value);
    }

    textAnswers.clear();
    dropdownAnswers.clear();
  }

  Widget buildQuestion(QuizQuestion question, String parentKey) {
    String questionKey = parentKey.isEmpty ? question.text : '$parentKey - ${question.text}';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(
            question.text,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        if (question.dropdownAnswers.isNotEmpty) ...[
          SizedBox(
            width: double.infinity,
            child: DropdownButton<String>(
              isExpanded: true,
              value: dropdownAnswers[questionKey],
              hint: const Text('Select an option'),
              onChanged: (value) {
                handleDropdownAnswerChange(questionKey, value);
              },
              items: question.dropdownAnswers.map((answer) {
                return DropdownMenuItem(
                  value: answer,
                  child: Text(answer),
                );
              }).toList(),
            ),
          ),
        ] else if (question.textAnswer) ...[
          TextField(
            onChanged: (value) {
              handleTextAnswerChange(questionKey, value);
            },
            decoration: const InputDecoration(
              hintText: 'Enter your answer',
            ),
          ),
        ],
        if (question.subQuestions.isNotEmpty && expandedQuestions.contains(questionKey)) 
          ...question.subQuestions.map((subQuestion) {
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: buildQuestion(subQuestion, questionKey),
            );
          }),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBarText: 'SDQ Page',
      body: Container(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: widget.endIndex - widget.startIndex + 1,
                itemBuilder: (context, index) {
                  final question = questions[widget.startIndex + index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: buildQuestion(question, ''),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await saveAnswers();
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Success'),
                        content: const Text('Data has been saved successfully!'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) {
                                    if (widget.startIndex == 0) {
                                      return EatingHabits(dbHelper: widget.dbHelper);
                                    } else if (widget.startIndex == 11) {
                                      return PsssHabits(habitType: 0, dbHelper: widget.dbHelper);
                                    } else if(widget.startIndex == 15){
                                      return PsssHabits(habitType: 2, dbHelper: widget.dbHelper);
                                    } else if(widget.startIndex == 18){
                                      return PsssHabits(habitType: 3, dbHelper: widget.dbHelper);
                                    } else {
                                      return HomePage(dbHelper: widget.dbHelper);
                                    }
                                  },
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
