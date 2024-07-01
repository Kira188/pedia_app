import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pedia/models/sdc_data.dart';

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
  final List<SdcData> _sdcDataList = [];

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
              TextFormField(
                controller: _weightController,
                decoration: const InputDecoration(labelText: 'Weight (kg)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your weight';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _heightController,
                decoration: const InputDecoration(labelText: 'Height (m)'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your height';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: const InputDecoration(labelText: 'Birthday (yyyy-mm-dd)'),
                keyboardType: TextInputType.datetime,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your birthday';
                  }
                  return null;
                },
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

  void _addSdcData() {
    final weight = double.parse(_weightController.text);
    final height = double.parse(_heightController.text);
    final age = DateFormat('yyyy-MM-dd').parse(_ageController.text);
    final gender = _gender;

    final sdcData = SdcData(
      weight: weight,
      height: height,
      age: age,
      gender: gender,
    );

    setState(() {
      _sdcDataList.add(sdcData);
    });

    // Clear the form
    _weightController.clear();
    _heightController.clear();
    _ageController.clear();
    setState(() {
      _gender = 'Male';
    });

    // Show a dialog to confirm the data has been added
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Data has been added successfully!'),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
