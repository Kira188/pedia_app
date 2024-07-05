import 'package:pedia/models/questions_model.dart';

final List<QuizQuestion> questions = [
  const QuizQuestion(
    text: 'Name of the Father:',
    textAnswer: true,
  ),
  const QuizQuestion(
    text: 'Name of the Mother:',
    textAnswer: true,
  ),
  const QuizQuestion(
    text: 'Do you have siblings?',
    dropdownAnswers: ['Yes', 'No'],
    subQuestions: [
      QuizQuestion(
        text: 'Brothers:',
        textAnswer: true,
      ),
      QuizQuestion(
        text: 'Sisters:',
        textAnswer: true,
      ),
    ],
  ),
  const QuizQuestion(
    text: 'Contact Number of Father:',
    textAnswer: true,
  ),
  const QuizQuestion(
    text: 'Contact Number of Mother:',
    textAnswer: true,
  ),
  const QuizQuestion(
    text: 'Birth Order of the Child:',
    dropdownAnswers: ['1st Child', '2nd Child', '>2 Children'],
  ),
  const QuizQuestion(
    text: 'Type of the family:',
    dropdownAnswers: ['Nuclear', 'Joint', 'Three  Generation'],
  ),
  const QuizQuestion(
    text: 'Does anybody in the family look fat?',
    dropdownAnswers: ['Yes', 'No', 'Cannot tell'],
    subQuestions: [
      QuizQuestion(
        text: 'If YES, how is he/ she related to you?',
        textAnswer: true,
      ),
    ],
  ),
  const QuizQuestion(
    text: 'Is anyone in the family suffering from diabetes?',
    dropdownAnswers: ['Yes', 'No', 'Don’t know'],
    subQuestions: [
      QuizQuestion(
        text: 'If YES, please select the following:',
        dropdownAnswers: [
          'Both Parents suffer from Diabetes',
          'Father suffers from Diabetes',
          'Mother suffers from Diabetes',
        ],
      ),
    ],
  ),
  const QuizQuestion(
    text:
        'Is anyone in the family suffering from Hypertension or taking medicines for High BP?',
    dropdownAnswers: ['Yes', 'No', 'Don’t know'],
    subQuestions: [
      QuizQuestion(
        text: 'If YES, how is he/ she related to you?',
        dropdownAnswers: [
          'Both Parents suffer from HTN',
          'Father suffers from HTN',
          'Mother suffers from HTN',
        ],
      ),
    ],
  ),
  const QuizQuestion(
    text: 'Is anybody in the family suffering from thyroid dysfunction?',
    dropdownAnswers: ['Yes', 'No', 'Dont know'],
    subQuestions: [
      QuizQuestion(
        text: 'If YES, how is he/ she related to you?',
        dropdownAnswers: [
          'Both Parents suffer from Thyroid dysfunction',
          'Father suffers from Thyroid dysfunction',
          'Mother suffers from Thyroid dysfunction',
        ],
      ),
    ],
  ),
];