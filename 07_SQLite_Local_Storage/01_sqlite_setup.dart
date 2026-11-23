import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DatabaseScreen(),
    );
  }
}

class DatabaseScreen extends StatefulWidget {
  DatabaseScreen({super.key});

  @override
  State<DatabaseScreen> createState() => _DatabaseScreenState();
}

class _DatabaseScreenState extends State<DatabaseScreen> {
  String message = "Database not created";

  Future<void> createDatabase() async {
    String path = join(await getDatabasesPath(), "student.db");

    Database database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
        );
      },
    );

    setState(() {
      message = "Database Created Successfully!";
    });

    await database.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SQLite Database"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: createDatabase,
              child: Text("Create Database"),
            ),
          ],
        ),
      ),
    );
  }
}
