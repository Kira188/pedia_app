import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pedia/data/questions_data.dart';
import 'package:pedia/models/questions_model.dart';

class QuestionsScreen extends StatefulWidget{
  const QuestionsScreen({super.key});
  @override
  State<StatefulWidget> createState() {
   
    return _QuestionsScreenState();
  }
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final Map<int, String> answers = {};
  final Map<String, String> textAnswers = {};

  void handleAnswerChange(int questionIndex, String answer) {
    setState(() {
      answers[questionIndex] = answer;
    });
  }

  void handleTextAnswerChange(String questionKey, String answer) {
    setState(() {
      textAnswers[questionKey] = answer;
    });
  }

  Widget buildQuestion(QuizQuestion question, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          question.text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        if (question.answers.isNotEmpty) ...[
          DropdownButton<String>(
            value: answers[index],
            hint: Text('Select an option'),
            onChanged: (value) {
              handleAnswerChange(index, value!);
            },
            items: question.answers.map((answer) {
              return DropdownMenuItem(
                value: answer,
                child: Text(answer),
              );
            }).toList(),
          ),
        ] else if (question.text.contains('Contact Number') || question.text.contains('siblings')) ...[
          TextField(
            onChanged: (value) {
              handleTextAnswerChange(question.text, value);
            },
            decoration: InputDecoration(
              hintText: 'Enter your answer',
            ),
          ),
        ] else ...[
          TextField(
            onChanged: (value) {
              handleTextAnswerChange(question.text, value);
            },
            decoration: InputDecoration(
              hintText: 'Enter your answer',
            ),
          ),
        ],
        if (question.subQuestions.isNotEmpty && answers[index] == 'Yes')
          ...question.subQuestions.map((subQuestion) {
            int subIndex = questions.indexOf(subQuestion);
            return Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8.0),
              child: buildQuestion(subQuestion, subIndex),
            );
          }).toList(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Socio-Demographic Questionnaire')),
      body: ListView.builder(
        itemCount: questions.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: buildQuestion(questions[index], index),
          );
        },
      ),
    );
  }
}