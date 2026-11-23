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
      home: DeleteDataScreen(),
    );
  }
}

class DeleteDataScreen extends StatefulWidget {
  DeleteDataScreen({super.key});

  @override
  State<DeleteDataScreen> createState() => _DeleteDataScreenState();
}

class _DeleteDataScreenState extends State<DeleteDataScreen> {
  String message = "No data deleted";

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

  Future<void> deleteData() async {
    Database db = await openStudentDatabase();

    int result = await db.delete(
      "student",
      where: "id = ?",
      whereArgs: [1],
    );

    setState(() {
      message = result > 0
          ? "Student Deleted Successfully!"
          : "Student Not Found";
    });

    await db.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Delete SQLite Data"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: deleteData,
              child: Text("Delete Student"),
            ),
          ],
        ),
      ),
    );
  }
}
