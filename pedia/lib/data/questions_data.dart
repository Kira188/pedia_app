// questions_data.dart
import 'package:pedia/models/questions_model.dart';

final List<QuizQuestion> questions = [
  QuizQuestion(
    text: 'Do you stay in a hostel?',
    answers: ['Yes', 'No'],
  ),
  QuizQuestion(
    text: 'Name of the Father:',
    answers: [],
  ),
  QuizQuestion(
    text: 'Name of the Mother:',
    answers: [],
  ),
  QuizQuestion(
    text: 'Contact Number of Father:',
    answers: [],
  ),
  QuizQuestion(
    text: 'Contact Number of Mother:',
    answers: [],
  ),
  QuizQuestion(
    text: 'How many siblings do you have?',
    answers: [],
    subQuestions: [
      QuizQuestion(
        text: 'Brothers:',
        answers: [],
      ),
      QuizQuestion(
        text: 'Sisters:',
        answers: [],
      ),
    ],
  ),
  QuizQuestion(
    text: 'Birth Order of the Child:',
    answers: ['1st Child', '2nd Child', '>2 Children'],
  ),
  QuizQuestion(
    text: 'Type of the family:',
    answers: ['Nuclear', 'Joint', 'Three – Generation'],
  ),
  QuizQuestion(
    text: 'Does anybody in the family look fat?',
    answers: ['Yes', 'No', 'Cannot tell'],
    subQuestions: [
      QuizQuestion(
        text: 'If YES, how is he/ she related to you?',
        answers: [],
      ),
    ],
  ),
  QuizQuestion(
    text: 'Is anyone in the family suffering from diabetes?',
    answers: ['Yes', 'No', 'Don’t know'],
    subQuestions: [
      QuizQuestion(
        text: 'If YES, please tick the following:',
        answers: [
          'Both Parents suffer from Diabetes',
          'Father suffers from Diabetes',
          'Mother suffers from Diabetes',
        ],
      ),
    ],
  ),
  QuizQuestion(
    text: 'Is anyone in the family suffering from Hypertension or taking medicines for High BP?',
    answers: ['Yes', 'No', 'Don’t know'],
    subQuestions: [
      QuizQuestion(
        text: 'If YES, how is he/ she related to you?',
        answers: [
          'Both Parents suffer from HTN',
          'Father suffers from HTN',
          'Mother suffers from HTN',
        ],
      ),
    ],
  ),
  QuizQuestion(
    text: 'Is anybody in the family suffering from thyroid dysfunction?',
    answers: ['Yes', 'No', 'Don’t know'],
    subQuestions: [
      QuizQuestion(
        text: 'If YES, how is he/ she related to you?',
        answers: [
          'Both Parents suffer from Thyroid dysfunction',
          'Father suffers from Thyroid dysfunction',
          'Mother suffers from Thyroid dysfunction',
        ],
      ),
    ],
  ),
];