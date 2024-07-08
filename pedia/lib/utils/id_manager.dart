// // utils/id_manager.dart
// import 'package:pedia/database_helper.dart';

// class IDManager {
//   static int _currentId = 0;
//   static bool _initialized = false;

//   static Future<void> initialize() async {
//     if (!_initialized) {
//       final dbHelper = DatabaseHelper();
//       _currentId = await dbHelper.getMaxStudentId();
//       _initialized = true;
//     }
//   }

//   static int getNextId() {
//     return ++_currentId;
//   }
// }