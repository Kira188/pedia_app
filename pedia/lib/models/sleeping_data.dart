enum Category {
  falling,
  wakeUp,
  noise,
  wakeUp2,
  classes,
  headache,
  irritated,
  studies,
  forget,
}

const List<String> frequencyOptions = [
  'Never',
  'Rarely',
  'Sometimes',
  'Often',
  'Almost Always',
];

const List<String> categoryNames = [
  'I have difficulty falling asleep (cannot get sleep within 30 minutes)',
  'I wake up while sleeping (bad dreams etc.,)',
  'I wake up easily from the noise',
  'I have difficulty getting back to sleep once I wake up in the middle of the night',
  'Sleepiness interferes with my classes',
  'Poor sleep gives me a headache',
  'Poor sleep makes me irritated',
  'Poor sleep makes me lose interest in work/studies',
  'Poor sleep makes me forget things more easily',
];

class SleepingData {
  Map<Category, String> choices = {};

  SleepingData();

  int get calculatedSleepingScore {
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
