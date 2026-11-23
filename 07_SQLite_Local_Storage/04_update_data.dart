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
      home: UpdateDataScreen(),
    );
  }
}

class UpdateDataScreen extends StatefulWidget {
  UpdateDataScreen({super.key});

  @override
  State<UpdateDataScreen> createState() => _UpdateDataScreenState();
}

class _UpdateDataScreenState extends State<UpdateDataScreen> {
  String message = "No data updated";

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

  Future<void> updateData() async {
    Database db = await openStudentDatabase();

    int result = await db.update(
      "student",
      {
        "name": "Mihir Dhedhi",
        "age": 21,
      },
      where: "id = ?",
      whereArgs: [1],
    );

    setState(() {
      message = result > 0
          ? "Student Updated Successfully!"
          : "Student Not Found";
    });

    await db.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Update SQLite Data"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: updateData,
              child: Text("Update Student"),
            ),
          ],
        ),
      ),
    );
  }
}
