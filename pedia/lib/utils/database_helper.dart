import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:pedia/models/sdc_model.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static Database? _database;

  factory DatabaseHelper() {
    return _instance;
  }

  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'sdc_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE sdc(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        weight REAL,
        height REAL,
        age TEXT,
        gender TEXT,
        schoolName TEXT,
        fullName TEXT,
        classSection TEXT,
        address TEXT,
        bmi REAL,
        riskFactor TEXT
      )
    ''');
  }

  Future<int> insertSdcModel(SdcModel sdcModel) async {
    Database db = await database;
    return await db.insert('sdc', sdcModel.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<SdcModel>> getSdcModels() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('sdc');
    return List.generate(maps.length, (i) {
      return SdcModel.fromMap(maps[i]);
    });
  }

  Future<int> updateSdcModel(SdcModel sdcModel) async {
    Database db = await database;
    return await db.update(
      'sdc',
      sdcModel.toMap(),
      where: 'id = ?',
      whereArgs: [sdcModel.id],
    );
  }

  Future<int> deleteSdcModel(int id) async {
    Database db = await database;
    return await db.delete(
      'sdc',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
