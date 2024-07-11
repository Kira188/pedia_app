import 'package:pedia/models/questions_model.dart';

final List<QuizQuestion> questions = [
  const QuizQuestion(
    text: 'Do you stay in hostel?',
    dropdownAnswers: ['Yes', 'No'],
  ),
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
    dropdownAnswers: ['Nuclear', 'Joint', 'Three Generation'],
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
    dropdownAnswers: ['Yes', 'No', 'Don’t know'],
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
  // Additional Questions
  const QuizQuestion(
    text: 'How many days per week do you have Physical Training (PT) classes at school/college?',
    dropdownAnswers: [
      '0 Day / No Classes',
      '1 Day',
      '2 days',
      '3 days',
      '4 days',
      '5 days',
      '6 days'
    ],
  ),
  const QuizQuestion(
    text: 'If you have PT, on average, how long is each PT/PE period? ______minutes per class',
    textAnswer: true,
  ),
  const QuizQuestion(
    text: 'Do you play/ participate/ take part in PT/PE classes?',
    dropdownAnswers: ['Yes', 'No'],
    subQuestions: [
      QuizQuestion(
        text: 'If Yes, what types of games do you play?',
        dropdownAnswers: ['Indoor games', 'Outdoor games'],
      ),
    ],
  ),
  const QuizQuestion(
    text: 'Are you involved in any of the following activities in your school/college?',
    dropdownAnswers: ['Scouts and Guides', 'NCC', 'Others, Specify'],
    textAnswer: true, // To allow user to specify 'Others'
  ),
  const QuizQuestion(
    text: 'How do you describe your weight?',
    dropdownAnswers: [
      'Very underweight',
      'Slightly underweight',
      'About the right weight',
      'Slightly overweight',
      'Very overweight'
    ],
  ),
  const QuizQuestion(
    text: 'Which of the following are you trying to do about your weight?',
    dropdownAnswers: [
      'Lose weight',
      'Gain weight',
      'Stay the same weight'
    ],
  ),
  const QuizQuestion(
    text: 'Are you being bullied for weight by your friends or family?',
    dropdownAnswers: ['Yes', 'No'],
  ),
  const QuizQuestion(
    text: 'At what time do you usually go to bed?',
    textAnswer: true,
  ),
  const QuizQuestion(
    text: 'What is the usual time of getting up from the bed?',
    textAnswer: true,
  ),
];