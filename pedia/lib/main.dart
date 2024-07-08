import 'package:flutter/material.dart';
import 'package:pedia/home_page.dart';
import 'package:pedia/database_helper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final DatabaseHelper dbHelper = DatabaseHelper();

    return MaterialApp(
      title: 'Pedia Predict',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(dbHelper: dbHelper),
    );
  }
}
/*
import 'package:flutter/material.dart';
import 'package:pedia/psss/psss_habits.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pedia Predict',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const PsssHabits(habitType: 3), // You can change the habitType here
    );
  }
}
*/