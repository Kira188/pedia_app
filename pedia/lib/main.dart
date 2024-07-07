import 'package:pedia/eating/eating_habits.dart';
import 'package:pedia/home_page.dart';
import 'package:flutter/material.dart';
import 'package:pedia/physical/physical_habits.dart';
import 'package:pedia/questions_screen.dart';
import 'package:pedia/sdc/sdc_page.dart';
import 'package:pedia/sedentary/sedentary_habits.dart';
import 'package:pedia/sedentarytwo/sedentary_habits_two.dart';
import 'package:pedia/sleeping/sleeping_habits.dart';


void main() {
  runApp( const MaterialApp(
    home: Scaffold(
      body: QuestionsScreen(startIndex: 0,endIndex: 2,),
    ),
  ));
}
