import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:bcrypt/bcrypt.dart';
import 'package:teste/models/user_model.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';


class LocalDataSource {
  static final LocalDataSource _instance = LocalDataSource._();

  factory LocalDataSource() => _instance;

  LocalDataSource._();

  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }


  Future<void> _createUserTable(Database db) async {
    await db.execute(
      '''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY,
        username TEXT,
        email TEXT UNIQUE,
        senha TEXT,
        data DATETIME
      )
      ''',
    );
  }


  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'banco.db');
    return openDatabase(
      path,
      onCreate: (db, version) async {
        await _createUserTable(db);
      },
      version: 1,
    );
  }




  Future<bool> registerUser(
      String username, String email, String senha) async {
    try {
      final hashedSenha = BCrypt.hashpw(senha, BCrypt.gensalt());
      final user = User(
        username: username,
        email: email,
        senha: hashedSenha,
        data: DateTime.now(),
      );
      final db = await database;
      await db.insert(
        'users',
        user.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );

      return true;
    } catch (e) {
      print('Erro durante o registro do usuário: $e');
      return false;
    }
  }

  Future<bool> verifyLogin(String email, String senha) async {
    final user = await getUserByMail(email);
    if (user != null) {
      return await user.verifyPassword(senha);
    }
    return false;
  }

  Future<List<User>> getUsers() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User.fromMap(maps[i]);
    });
  }

  Future<User?> getUserByMail(String email) async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query(
      'users',
      where: 'email = ?',
      whereArgs: [email],
    );
    if (maps.isNotEmpty) {
      return User(
        id: maps[0]['id'],
        username: maps[0]['username'],
        email: maps[0]['email'],
        senha: maps[0]['senha'],
        data: DateTime.parse(maps[0]['data']),
      );
    }
    return null;
  }

  Future<void> updateUser(User user) async {
    final db = await database;
    final hashedSenha= BCrypt.hashpw(user.senha, BCrypt.gensalt());

    await db.update(
      'users',
      {
        'username': user.username,
        'email': user.email,
        'senhaHash': hashedSenha,
        'data': DateTime.now().toIso8601String(),
      },
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<void> changeUserActiveStatus(int userId, bool status) async {
    final db = await database;

    await db.update(
      'users',
      {'isActive': status ? 1 : 0},
      where: 'id = ?',
      whereArgs: [userId],
    );
  }
}