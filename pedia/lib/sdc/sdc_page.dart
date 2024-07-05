import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedia/gradient_scaffold.dart';
import 'package:pedia/models/sdc_model.dart';
import 'package:pedia/data/sdc_data.dart';

import 'package:pedia/questions_screen.dart';

class SdcPage extends StatefulWidget {
  const SdcPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _SdcPageState();
  }
}

class _SdcPageState extends State<SdcPage> {
  final _formKey = GlobalKey<FormState>();
  final _weightController = TextEditingController();
  final _heightController = TextEditingController();
  final _ageController = TextEditingController();
  final _schoolNameController = TextEditingController();
  final _fullNameController = TextEditingController();
  final _classSectionController = TextEditingController();
  final _addressController = TextEditingController();
  String? _gender;
  DateTime? _selectedDate;
  final List<SdcModel> _sdcDataList = [];

  int _calculateAgeInMonths(DateTime birthDate, DateTime currentDate) {
    int years = currentDate.year - birthDate.year;
    int months = currentDate.month - birthDate.month;
    if (months < 0) {
      years--;
      months += 12;
    }

    // Calculate the fraction of the current month that has passed
    double dayFraction = (currentDate.day - birthDate.day) / 30.0;

    // Add the day fraction to the total months and floor the result
    return (years * 12 + months + dayFraction).floor();
  }

  void _printFormData(SdcModel sdcData) {
    debugPrint('School Name: ${sdcData.schoolName}');
    debugPrint('Full Name: ${sdcData.fullName}');
    debugPrint('Class and Section: ${sdcData.classSection}');
    debugPrint('Address: ${sdcData.address}');
    debugPrint('Weight (kg): ${sdcData.weight}');
    debugPrint('Height (m): ${sdcData.height}');
    debugPrint('Birthday: ${sdcData.age}');
    debugPrint('Gender: ${sdcData.gender}');
    debugPrint('BMI: ${sdcData.bmi.toStringAsFixed(2)}');
    debugPrint('Risk Category: ${sdcData.riskFactor}');
  }

  String _calculateRisk(
      String gender, DateTime birthDate, DateTime currentDate, double bmi) {
    int ageInMonths = _calculateAgeInMonths(birthDate, currentDate);
    debugPrint("Age in Months is $ageInMonths");
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
      if (bmi > sdValues[6]) {
        // Check if BMI is greater than +2 SD
        return 'Obese';
      } else if (bmi <= sdValues[5] && bmi > 0) {
        // Check if BMI is less than or equal to +1 SD
        return 'Not Obese';
      } else {
        return 'Cannot Handle BMI';
      }
    } else {
      return 'Cannot Generate SD';
    }
  }

  void _addSdcData() {
    if (!_formKey.currentState!.validate()) {
      return; // Return if the form is not valid
    }

    final weight = double.parse(_weightController.text);
    final height = double.parse(_heightController.text);
    final birthDate = _selectedDate!;
    final gender = _gender!;
    final schoolName = _schoolNameController.text;
    final fullName = _fullNameController.text;
    final classSection = _classSectionController.text;
    final address = _addressController.text;

    final bmi = weight / (height * height);
    final currentDate = DateTime.now();
    final riskCategory = _calculateRisk(gender, birthDate, currentDate, bmi);

    final sdcData = SdcModel(
      weight: weight,
      height: height,
      age: birthDate,
      gender: gender,
      schoolName: schoolName,
      fullName: fullName,
      classSection: classSection,
      address: address,
      bmi: bmi,
      riskFactor: riskCategory,
    );

    setState(() {
      _sdcDataList.add(sdcData);
    });

    // Clear the form
    _weightController.clear();
    _heightController.clear();
    _ageController.clear();
    _schoolNameController.clear();
    _fullNameController.clear();
    _classSectionController.clear();
    _addressController.clear();
    setState(() {
      _gender = null; // Reset gender to null
      _selectedDate = null; // Reset date
    });

    // Show a dialog to confirm the data has been added
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: Text(
              'Data has been added successfully!\n\nBMI: ${bmi.toStringAsFixed(2)}\nRisk Category: $riskCategory'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return const QuestionsScreen();
                }));
              },
            ),
          ],
        );
      },
    );

    // Print the form data to the console
    _printFormData(sdcData);
  }

  void _presentDatepicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 17, now.month, now.day);
    final lastDate = DateTime(now.year - 10, now.month, now.day);
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: firstDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickedDate;
      if (_selectedDate != null) {
        _ageController.text = DateFormat('yyyy-MM-dd').format(_selectedDate!);
      }
    });
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    _ageController.dispose();
    _schoolNameController.dispose();
    _fullNameController.dispose();
    _classSectionController.dispose();
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      appBarText: "SDC Page",
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                SizedBox(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: <Widget>[
                        _buildTextField(_schoolNameController,
                            'Name of the School', TextInputType.text),
                        _buildTextField(_fullNameController, 'Full Name',
                            TextInputType.text),
                        _buildTextField(_classSectionController,
                            'Class and Section', TextInputType.text),
                        _buildTextField(
                            _addressController, 'Address', TextInputType.text),
                        _buildTextField(_weightController, 'Weight (kg)',
                            TextInputType.number),
                        _buildTextField(_heightController, 'Height (m)',
                            TextInputType.number),
                        Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _ageController,
                                decoration: const InputDecoration(
                                  labelText: 'Birthday (yyyy-mm-dd)',
                                ),
                                readOnly: true,
                                onTap: _presentDatepicker,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your Birthday';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            IconButton(
                              onPressed: _presentDatepicker,
                              icon: const Icon(Icons.calendar_today),
                            ),
                          ],
                        ),
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
                          decoration:
                              const InputDecoration(labelText: 'Gender'),
                          validator: (value) => value == null
                              ? 'Please select your Gender'
                              : null,
                        ),
                        const SizedBox(
                          height: 10,
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
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText,
      TextInputType keyboardType,
      {bool validateDate = false}) {
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
