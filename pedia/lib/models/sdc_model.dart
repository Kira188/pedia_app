class SdcModel {
  double weight;
  double height;
  DateTime age;
  String gender;
  String schoolName;
  String fullName;
  String classSection;
  String address;
  double bmi;
  String riskFactor;

  SdcModel({
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
    required this.schoolName,
    required this.fullName,
    required this.classSection,
    required this.address,
    required this.bmi,
    required this.riskFactor,
  });

  double calculateBmi() => weight / (height * height);
}
