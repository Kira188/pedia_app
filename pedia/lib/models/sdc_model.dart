class SdcModel {
  double weight;
  double height;
  DateTime age;
  String gender;

  SdcModel({
    required this.weight,
    required this.height,
    required this.age,
    required this.gender,
  });
  double get bmi =>
     weight / (height * height);
}
