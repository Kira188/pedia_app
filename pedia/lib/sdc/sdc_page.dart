import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedia/models/sdc_model.dart';
import 'package:pedia/data/sdc_data.dart';

class SdcPage extends StatefulWidget {
  const SdcPage({super.key});
  @override
  State<StatefulWidget> createState(){
    return _SdcPageState();
  }
}

class _SdcPageState extends State<SdcPage> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _ageController = TextEditingController();
  String _gender = 'Male';
  final List<SdcModel> _sdcDataList = [];

  int _calculateAgeInMonths(DateTime birthDate, DateTime currentDate) {
    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    if (months < 0) {
      years--;
      months += 12;
    }
    return years * 12 + months;
  }

  String _calculateRisk(String gender, DateTime birthDate, DateTime currentDate, double bmi) {
  int ageInMonths = _calculateAgeInMonths(birthDate, currentDate);
  debugPrint(ageInMonths.toString());
  Map<int, List<double>> genderMap;

  if (gender.toLowerCase() == 'male') {
    genderMap = SdcData.maleMap;
  } else if (gender.toLowerCase() == 'female') {
    genderMap = SdcData.femaleMap;
  } else {
    return 'Invalid gender';
  }

  if (!genderMap.containsKey(ageInMonths)) {
    return 'Age data not available';
  }

  List<double>? sdValues = genderMap[ageInMonths];
  if (sdValues != null) {
    if (bmi > sdValues[6] && bmi < 40) {  // Check if BMI is greater than +2 SD
        return 'Obesity';
    } else if (bmi <= sdValues[5] && bmi > 0) {  // Check if BMI is less than or equal to +1 SD
        return 'Non-obese';
    } else {
        
        return 'Cant Handle BMI';  
    }
  } else {
    // Handle case where SD values are null (cannot generate SD)
    return 'Cannot Generate SD';
  }
}


  void _addSdcData() {
  if (!_formKey.currentState!.validate()) {
    return; // Return if the form is not valid
  }

  final weight = double.parse(_weightController.text);
  final height = double.parse(_heightController.text);
  final birthDate = DateFormat('yyyy-MM-dd').parse(_ageController.text);
  final gender = _gender;

  final sdcData = SdcModel(
    weight: weight,
    height: height,
    age: birthDate,
    gender: gender,
  );

  setState(() {
    _sdcDataList.add(sdcData);
  });

  final currentDate = DateTime.now();
  final bmi = sdcData.bmi;
  final riskCategory = _calculateRisk(gender, birthDate, currentDate, bmi);

  // Clear the form
  _weightController.clear();
  _heightController.clear();
  _ageController.clear();
  setState(() {
    _gender = 'Male'; // Reset gender to default
  });

  // Show a dialog to confirm the data has been added
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Success'),
        content: Text('Data has been added successfully!\n\nBMI: ${bmi.toStringAsFixed(2)}\nRisk Category: $riskCategory'),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
            onPressed: () {
              Navigator.of(context).pop(); // Close dialog
            },
          ),
        ],
      );
    },
  );
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Info Form'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              _buildTextField(_weightController, 'Weight (kg)', TextInputType.number),
              _buildTextField(_heightController, 'Height (m)', TextInputType.number),
              _buildTextField(_ageController, 'Birthday (yyyy-mm-dd)', TextInputType.datetime, validateDate: true),
              DropdownButtonFormField<String>(
                value: _gender,
                items: ['Male', 'Female'].map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (newValue) {
                  setState(() {
                    _gender = newValue!;
                  });
                },
                decoration: const InputDecoration(labelText: 'Gender'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _addSdcData();
                  }
                },
                child: const Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, TextInputType keyboardType, {bool validateDate = false}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(labelText: labelText),
      keyboardType: keyboardType,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your $labelText';
        }
        if (validateDate) {
          try {
            DateFormat('yyyy-MM-dd').parse(value);
          } catch (_) {
            return 'Please enter a valid date (yyyy-mm-dd)';
          }
        }
        return null;
      },
    );
  }
}
