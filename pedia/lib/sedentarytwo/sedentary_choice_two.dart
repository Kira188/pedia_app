import 'package:flutter/material.dart';
import 'package:pedia/models/sedentary_data_two.dart';

class SedentaryChoiceTwo extends StatefulWidget {
  final Category category;

  const SedentaryChoiceTwo({super.key, required this.category});

  @override
  _SedentaryChoiceTwoState createState() => _SedentaryChoiceTwoState();
}

class _SedentaryChoiceTwoState extends State<SedentaryChoiceTwo> {
  String? _selectedFrequency;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(32.0),
            child: Text(
              'Select Frequency',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: frequencyOptions.length,
              itemBuilder: (ctx, idx) {
                return ListTile(
                  title: Text(frequencyOptions[idx]),
                  onTap: () {
                    setState(() {
                      _selectedFrequency = frequencyOptions[idx];
                    });
                    Navigator.pop(context, _selectedFrequency);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
