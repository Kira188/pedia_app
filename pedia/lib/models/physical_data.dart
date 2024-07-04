enum Category {
  dance,
  swimming,
  yoga,
  exercise,
  indoor,
  outdoor,
  play,
  self,
  walking,
}

const List<String> frequencyOptions = [
  'Never',
  '1 day',
  '2 days',
  '3 days',
  '4 days',
  '5 days',
  '6 days',
  '7 days',
  'On ONE of those days, how long does the activity last?',
];

const List<String> categoryNames = [
  'Dance',
  'Swimming',
  'Yoga',
  'Exercise',
  'Indoor games: table tennis, badminton, etc.',
  'Outdoor games: cricket, football, kho kho, etc.',
  'Play after school hours',
  'Self (Bicycle)',
  'Walking',
];

class PhysicalData {
  Map<Category, String> choices = {};

  PhysicalData();

  int get calculatedPhysicalScore {
    int score = 0;
    for (String frequency in choices.values) {
      if (frequency == 'Never') {
        score += 0;
      } else if (frequency == '1 day') {
        score += 1;
      } else if (frequency == '2 days') {
        score += 2;
      } else if (frequency == '3 days') {
        score += 3;
      } else if (frequency == '4 days') {
        score += 4;
      } else if (frequency == '5 days') {
        score += 5;
      } else if (frequency == '6 days') {
        score += 6;
      } else if (frequency == '7 days') {
        score += 7;
      } else if (frequency == 'On ONE of those days, how long does the activity last?') {
        score += 8;
      }
    }
    return score;
  }
}
