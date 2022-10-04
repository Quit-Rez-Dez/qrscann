


import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'package:qrscann/Models/scan_model.dart';
export 'package:qrscann/Models/scan_model.dart';


import 'package:path/path.dart';

class DBProvider{

  static   Database? _database;
  /// ._ signififa constructor privado
  static final DBProvider db=DBProvider._();

  DBProvider._();

  Future<Database?> get database async{


    _database ??=await initDB();

    return
      _database;

  }

  Future<Database> initDB() async{

    //Path de donde almacena la base de datos
    Directory documentsDirectory =await getApplicationDocumentsDirectory();

    final path =join( documentsDirectory.path,'ScansDB.db' );
    print(path);

    //Crear base de datos
    return await openDatabase(
      path,
      version: 1,
      onOpen: (db) {},
      onCreate: (Database db, int version) async{

        await db.execute('''
          CREATE TABLE Scans (
            id INTEGER PRIMARY KEY,
            tipo TEXT,
            valor TEXT 
          )
          
          
        ''');
        }
    );


  }


  Future<int> nuevoScanRaw(ScanModel nuevoScan) async {

    final id = nuevoScan.id;
    final tipo0 = nuevoScan.tipo;
    final valor = nuevoScan.valor;

  ///verificar la base de datos
    final db=await database;

    final res= await db!.rawInsert('''
    INSERT INTO Scans (id, tipo, valor)
    VALUES(,tipo,valor)

    ''');

    return res; 
  }
  
  
  nuevoScan(ScanModel nuevoScan) async{
    
    final db = await database;

    ///To json ya tiene convertido a mapa los datos
    final res=await db!.insert('Scans', nuevoScan.toJson());
    print(res);

    return res;
  }


  Future<ScanModel?> getScanbyId (int id ) async{

    final db = await database;
    final res= await db!.query('Scans',where: 'id=?' , whereArgs: [id]);

    return res.isNotEmpty
        ? ScanModel.fromJson(res.first)
        : null;

  }


  Future<List?> getTodosScans () async{

    final db = await database;
    final res= await db!.query('Scans');

    return res.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : [];

  }

  Future<List?> getScansPorTipo (String tipo) async{

    final db = await database;
    final res= await db!.rawQuery('''
    SELECT *
    FROM Scans
    Where tipo = '$tipo'
    
    ''');

    return res.isNotEmpty
        ? res.map((s) => ScanModel.fromJson(s)).toList()
        : [];

  }

  Future <int> updateScan (ScanModel nuevoScan) async{

    final db = await database;
    final res= await db!.update('Scans', nuevoScan.toJson(),where: 'id=?' , whereArgs: [nuevoScan.id]);

    return res;
  }


  Future <int> deleteScans(int id) async{
    final db = await database;
    final res= await db!.delete('Scans',where: 'id=?' , whereArgs: [id]);

    return res;
  }


  Future <int> deletAllScans() async{
    final db = await database;
    final res= await db!.rawDelete('''
    DELETE FROM Scans
    
    ''');

    return res;
  }


}