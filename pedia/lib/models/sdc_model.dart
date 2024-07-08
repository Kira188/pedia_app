class SdcModel {
  final int? id;
  final double weight;
  final double height;
  final DateTime age;
  final String gender;
  final String schoolName;
  final String fullName;
  final String classSection;
  final String address;
  final double bmi;
  final String riskFactor;

  SdcModel({
    this.id,
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

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'weight': weight,
      'height': height,
      'age': age.toIso8601String(),
      'gender': gender,
      'schoolName': schoolName,
      'fullName': fullName,
      'classSection': classSection,
      'address': address,
      'bmi': bmi,
      'riskFactor': riskFactor,
    };
  }

  factory SdcModel.fromMap(Map<String, dynamic> map) {
    return SdcModel(
      id: map['id'],
      weight: map['weight'],
      height: map['height'],
      age: DateTime.parse(map['age']),
      gender: map['gender'],
      schoolName: map['schoolName'],
      fullName: map['fullName'],
      classSection: map['classSection'],
      address: map['address'],
      bmi: map['bmi'],
      riskFactor: map['riskFactor'],
    );
  }
}
