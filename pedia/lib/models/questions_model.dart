class QuizQuestion {
  const QuizQuestion({
    required this.text,
    this.dropdownAnswers = const [],
    this.textAnswer = false,
    this.subQuestions = const [],
  });

  final String text;
  final List<String> dropdownAnswers;
  final bool textAnswer;
  final List<QuizQuestion> subQuestions;
}
