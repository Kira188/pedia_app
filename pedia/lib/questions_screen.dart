import 'package:flutter/material.dart';
import 'package:pedia/data/questions_data.dart';
import 'package:pedia/models/questions_model.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final Map<int, String> dropdownAnswers = {};
  final Map<String, String> textAnswers = {};
  final Map<String, String> subDropdownAnswers = {};
  final Map<String, String> subTextAnswers = {};

  void handleDropdownAnswerChange(int questionIndex, String answer) {
    setState(() {
      dropdownAnswers[questionIndex] = answer;
    });
  }

  void handleTextAnswerChange(String questionKey, String answer) {
    setState(() {
      textAnswers[questionKey] = answer;
    });
  }

  void handleSubDropdownAnswerChange(String subQuestionKey, String answer) {
    setState(() {
      subDropdownAnswers[subQuestionKey] = answer;
    });
  }

  void handleSubTextAnswerChange(String subQuestionKey, String answer) {
    setState(() {
      subTextAnswers[subQuestionKey] = answer;
    });
  }

  void showAllAnswers() {
    debugPrint('Dropdown Answers:');
    dropdownAnswers.forEach((index, answer) {
      debugPrint('Question ${index + 1}: $answer');
    });

    debugPrint('\nText Field Answers:');
    textAnswers.forEach((questionKey, answer) {
      debugPrint('$questionKey: $answer');
    });

    debugPrint('\nSub-question Dropdown Answers:');
    subDropdownAnswers.forEach((subQuestionKey, answer) {
      debugPrint('$subQuestionKey: $answer');
    });

    debugPrint('\nSub-question Text Answers:');
    subTextAnswers.forEach((subQuestionKey, answer) {
      debugPrint('$subQuestionKey: $answer');
    });
  }

  Widget buildQuestion(QuizQuestion question, int index) {
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
          Row(
            children: [
              Expanded(
                child: DropdownButton<String>(
                  value: dropdownAnswers[index],
                  hint: const Text('Select an option'),
                  onChanged: (value) {
                    handleDropdownAnswerChange(index, value!);
                  },
                  items: question.dropdownAnswers.map((answer) {
                    return DropdownMenuItem(
                      value: answer,
                      child: Text(answer),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
        ] else if (question.textAnswer) ...[
          TextField(
            onChanged: (value) {
              handleTextAnswerChange(question.text, value);
            },
            decoration: const InputDecoration(
              hintText: 'Enter your answer',
            ),
          ),
        ],
        if (question.subQuestions.isNotEmpty && dropdownAnswers[index] == 'Yes')
          ...question.subQuestions.map((subQuestion) {
            String subQuestionKey = '${question.text} - ${subQuestion.text}';
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    subQuestion.text,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (subQuestion.dropdownAnswers.isNotEmpty) ...[
                    Row(
                      children: [
                        Expanded(
                          child: DropdownButton<String>(
                            value: subDropdownAnswers[subQuestionKey],
                            hint: const Text('Select an option'),
                            onChanged: (value) {
                              handleSubDropdownAnswerChange(subQuestionKey, value!);
                            },
                            items: subQuestion.dropdownAnswers.map((answer) {
                              return DropdownMenuItem(
                                value: answer,
                                child: Text(answer),
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ] else if (subQuestion.textAnswer) ...[
                    TextField(
                      onChanged: (value) {
                        handleSubTextAnswerChange(subQuestionKey, value);
                      },
                      decoration: const InputDecoration(
                        hintText: 'Enter your answer',
                      ),
                    ),
                  ],
                ],
              ),
            );
          }).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Socio-Demographic Questionnaire')),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: buildQuestion(questions[index], index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showAllAnswers();
        },
        child: const Icon(Icons.check),
      ),
    );
  }
}
