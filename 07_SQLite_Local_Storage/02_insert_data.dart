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
      home: InsertDataScreen(),
    );
  }
}

class InsertDataScreen extends StatefulWidget {
  InsertDataScreen({super.key});

  @override
  State<InsertDataScreen> createState() => _InsertDataScreenState();
}

class _InsertDataScreenState extends State<InsertDataScreen> {
  String message = "No data inserted";

  Future<Database> openStudentDatabase() async {
    String dbPath = join(await getDatabasesPath(), "student.db");

    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
        );
      },
    );
  }

  Future<void> insertData() async {
    Database db = await openStudentDatabase();

    await db.insert("student", {
      "name": "Mihir",
      "age": 20,
    });

    setState(() {
      message = "Student Data Inserted Successfully!";
    });

    await db.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Insert SQLite Data"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: insertData,
              child: Text("Insert Student"),
            ),
          ],
        ),
      ),
    );
  }
}
