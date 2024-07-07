import 'package:flutter/material.dart';
import 'package:pedia/models/sleeping_data.dart';

class SleepingChoice extends StatefulWidget {
  final Category category;

  const SleepingChoice({super.key, required this.category});

  @override
  _SleepingChoiceState createState() => _SleepingChoiceState();
}

class _SleepingChoiceState extends State<SleepingChoice> {
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
