import 'package:flutter/material.dart';
import 'package:pedia/data/questions_data.dart';
import 'package:pedia/models/questions_model.dart';
import 'package:pedia/gradient_scaffold.dart'; // Assuming GradientScaffold is defined in this file

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<StatefulWidget> createState() =>
   _QuestionsScreenState();
  
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final Map<String, String> textAnswers = {};
  final Map<String, String> dropdownAnswers = {};

  void handleDropdownAnswerChange(String questionKey, String answer) {
    setState(() {
      dropdownAnswers[questionKey] = answer;
    });
  }

  void handleTextAnswerChange(String questionKey, String answer) {
    setState(() {
      textAnswers[questionKey] = answer;
    });
  }

  void showAllAnswers() {
    debugPrint('Text Field Answers:');
    textAnswers.forEach((questionKey, answer) {
      debugPrint('$questionKey: $answer');
    });

    debugPrint('\nDropdown Answers:');
    dropdownAnswers.forEach((questionKey, answer) {
      debugPrint('$questionKey: $answer');
    });
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
                handleDropdownAnswerChange(questionKey, value!);
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
        if (question.subQuestions.isNotEmpty && dropdownAnswers[questionKey] == 'Yes')
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
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: buildQuestion(questions[index], ''),
                  );
                },
              ),
            ),
            const SizedBox(height: 16.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  showAllAnswers();
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
                              Navigator.of(context).pop();
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
