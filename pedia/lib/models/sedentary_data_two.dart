enum Category {
  walk,
  run,
  sports,
  attention,
  forget,
  studies,
  lonely,
  weight,
}

const List<String> frequencyOptions = [
  'Never',
  'Rarely',
  'Sometimes',
  'Often',
  'Almost Always',
];

const List<String> categoryNames = [
  'It is hard for me to walk',
  'It is hard for me to run',
  'It is hard for me to do sports activity or exercise',
  'It is hard to pay attention at school',
  'I forget things',
  'I have trouble keeping up with my work or studies',
  'I feel lonely and not interested in my work',
  'I feel I want to eat less to lose my weight',
];

class SedentaryDataTwo {
  Map<Category, String> choices = {};

  SedentaryDataTwo();

  int get calculatedSedentaryScore {
    int score = 0;
    for (String frequency in choices.values) {
      switch (frequency) {
        case 'Never':
          score += 0;
          break;
        case 'Rarely':
          score += 1;
          break;
        case 'Sometimes':
          score += 2;
          break;
        case 'Often':
          score += 3;
          break;
        case 'Almost Always':
          score += 4;
          break;
      }
    }
    return score;
  }
}
