import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final String usersTable = 'usersTable';
final String idColumn = 'idColumn';
final String userNameColumn = 'userNameColumn';
final String emailColumn = 'emailColumn';
final String senhaColumn = 'senhaColumn';
final String dataColumn = 'dataColumn';

class DatabaseProvider{

  static final DatabaseProvider _instance = DatabaseProvider.internal();

  factory DatabaseProvider() => _instance;

  DatabaseProvider.internal();
  Database? _db;

  Future <Database> get db async{
    if(_db != null){
      return _db!;
    }else{
      _db = await initDb();
      return _db!;
    }
  }

  Future<Database> initDb
  ()async{
    final databasesPath = await getDatabasesPath();
    final path = join(databasesPath, "usersnew.db");

    return await openDatabase(path, version: 1, onCreate: (Database db, int newerVersion)async{
      await db.execute(
        "CREATE TABLE $usersTable($idColumn INTEGER PRIMARY KEY, $userNameColumn TEXT, $emailColumn TEXT, $senhaColumn TEXT,$dataColumn TEXT)"
      );
    });
  }

  


}
