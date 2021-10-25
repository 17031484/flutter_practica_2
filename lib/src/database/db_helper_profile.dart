import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:practica2/src/models/profile_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class Helper_Profile {
  static final _nombreBD = "PERFILBD";
  static final _versionBD = 1;
  static final _nombreTBL = "tblPerfil";
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await _initDatabase();
    return _database;
  }

  Future<Database> _initDatabase() async {
    Directory carpeta = await getApplicationDocumentsDirectory();
    String rutaDB = join(carpeta.path, _nombreBD);
    return openDatabase(rutaDB, version: _versionBD, onCreate: _crearTabla);
  }

  Future<void> _crearTabla(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $_nombreTBL (id INTEGER PRIMARY KEY, nombre VARCHAR(100), a_paterno VARCHAR(100), a_materno VARCHAR(100), tel VARCHAR(100), email VARCHAR(100), foto VARCHAR(200))');
  }

  Future<int> update(Map<String, dynamic> row) async {
    var conexion = await database;
    return conexion!
        .update(_nombreTBL, row, where: 'id= ?', whereArgs: [row['id']]);
  }

  Future<ProfileModel> getPerfil(int id) async {
    var conexion = await database;
    var result =
        await conexion!.query(_nombreTBL, where: 'id=?', whereArgs: [id]);
    return ProfileModel.fromMap(result.first);
  }
}
