import 'package:flutter/material.dart';
import 'package:pedia/models/physical_data.dart';

class PhysicalChoice extends StatefulWidget {
  final Category category;

  const PhysicalChoice({super.key, required this.category});

  @override
  State<StatefulWidget> createState() {
    return _PhysicalChoiceState();
  }
}

class _PhysicalChoiceState extends State<PhysicalChoice> {
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
