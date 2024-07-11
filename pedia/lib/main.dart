import 'package:flutter/material.dart';
import 'package:pedia/home_page.dart';
import 'package:pedia/utils/database_helper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:pedia/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);
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

// import 'package:flutter/material.dart';
// import 'package:pedia/image_question.dart';
// import 'package:pedia/psss/psss_habits.dart';

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Pedia Predict',
//       theme: ThemeData(
//       ),
//       home: const ImageQuestion(), // You can change the habitType here
//     );
//   }
// }
