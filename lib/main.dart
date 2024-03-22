import 'package:flutter/material.dart';
import 'package:teste/TelaLogin.dart';
import 'package:teste/models/local_source.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'dart:io' show Platform;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (Platform.isAndroid || Platform.isIOS) {
    // Use sqflite plugin
    runApp(MyApp());
  } else {
    // Use sqflite_ffi plugin for other platforms (including web)
    sqfliteFfiInit();
    runApp(MyApp());
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TelaLogin(),
      debugShowCheckedModeBanner: false,
    );
  }
}
