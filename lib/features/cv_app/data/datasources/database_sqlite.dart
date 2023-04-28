
import '../../../../core/database_constanes.dart';
import '../models/resume_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'resumes.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE ${ConstansesDataBase.tableResumes} (
            ${ConstansesDataBase.columnId} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${ConstansesDataBase.columnPhone} TEXT NOT NULL,
            ${ConstansesDataBase.columnName} TEXT NOT NULL,
            ${ConstansesDataBase.columnImage} TEXT ,
            ${ConstansesDataBase.columnJobTitle} TEXT NOT NULL,
            ${ConstansesDataBase.columnEmail} TEXT NOT NULL,
            ${ConstansesDataBase.columnAddress} TEXT NOT NULL,
            ${ConstansesDataBase.columnUniversityName} TEXT NOT NULL,
            ${ConstansesDataBase.columnDegreeOfCertificates} TEXT NOT NULL,
            ${ConstansesDataBase.columnGraduationYear} TEXT NOT NULL,
            ${ConstansesDataBase.columnCertificates} TEXT NOT NULL,
            ${ConstansesDataBase.columnCertificatePeriod} TEXT NOT NULL,
            ${ConstansesDataBase.columnLink} TEXT NOT NULL,
            ${ConstansesDataBase.columnDescription} TEXT NOT NULL,
            ${ConstansesDataBase.columnNativeLanguage} TEXT NOT NULL,
            ${ConstansesDataBase.columnTechnicalSkills} TEXT NOT NULL,
            ${ConstansesDataBase.columnNonTechnicalSkills} TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<int> insertResume(ResumeModel resume) async {
    final db = await database;
    final response = await db.insert(
      ConstansesDataBase.tableResumes,
      resume.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    print("insert sucssecs=======================================");
    return response;
  }

  Future<int> deleteResume(int id) async {
    final db = await database;
    final response = await db.delete(
      ConstansesDataBase.tableResumes,
      where: '${ConstansesDataBase.columnId} = ?',
      whereArgs: [id],
    );
    return response;
  }

  Future<List<ResumeModel>> getResumes() async {
    final db = await database;
    final List<Map<String, dynamic>> maps =
        await db.query(ConstansesDataBase.tableResumes);
    return List.generate(maps.length, (i) {
      return ResumeModel.fromMap(maps[i]);
    });
  }
}
