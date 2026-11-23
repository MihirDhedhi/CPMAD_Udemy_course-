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
      home: ReadDataScreen(),
    );
  }
}

class ReadDataScreen extends StatefulWidget {
  ReadDataScreen({super.key});

  @override
  State<ReadDataScreen> createState() => _ReadDataScreenState();
}

class _ReadDataScreenState extends State<ReadDataScreen> {
  List<Map<String, dynamic>> students = [];

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

  Future<void> readData() async {
    Database db = await openStudentDatabase();

    List<Map<String, dynamic>> data = await db.query("student");

    setState(() {
      students = data;
    });

    await db.close();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Read SQLite Data"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: readData,
            child: Text("Load Students"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(students[index]["name"]),
                  subtitle: Text("Age: ${students[index]["age"]}"),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
