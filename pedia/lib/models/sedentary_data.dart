enum Category {
  tv,
  mobile,
  readingSchool,
  readingNonSchool,
  indoor,
  outdoor,
  tuition,
}

const List<String> frequencyOptions = [
  'Never',
  '< 1 Hr/ Day',
  '1 - 2 Hrs/Day',
  '2 - 3 Hrs/ Day',
  '>3 Hrs/ Day',
];

const List<String> categoryNames = [
  'Watching TV/videos/ movies/shows/ theatres',
  'Using mobile/ internet/ social media/ mobile games, Chatting, listening to music etc.,',
  'Reading and writing school related like Homework, textbook, notes, assignments, projects etc.,',
  'Non-school related  reading and writing - a book or magazine not for school (including comic books), writing articles, etc.,',
  'Playing indoor games Carrom, pacchi, ludo, snake and ladder, chess, etc.,',
  'Playing outdoor games antyakshari, dam sharads, business games, etc.,',
  'Tuition classes after school',
];

class SedentaryData {
  Map<Category, String> choices = {};

  SedentaryData();

  int get calculatedSedentaryScore {
    int score = 0;
    for (String frequency in choices.values) {
      switch (frequency) {
        case 'Never':
          score += 0;
          break;
        case '< 1 Hr/ Day':
          score += 1;
          break;
        case '1 - 2 Hrs/Day':
          score += 2;
          break;
        case '2 - 3 Hrs/ Day':
          score += 3;
          break;
        case '>3 Hrs/ Day':
          score += 4;
          break;
      }
    }
    return score;
  }
}