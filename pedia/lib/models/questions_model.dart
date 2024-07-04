class QuizQuestion {
  const QuizQuestion({
    required this.text,
    required this.answers,
    this.isMultiChoice = false,
    this.subQuestions = const [],
  });

  final String text;
  final List<String> answers;
  final bool isMultiChoice;
  final List<QuizQuestion> subQuestions;
}