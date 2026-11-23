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
      home: StudentScreen(),
    );
  }
}

class StudentScreen extends StatefulWidget {
  StudentScreen({super.key});

  @override
  State<StudentScreen> createState() => _StudentScreenState();
}

class _StudentScreenState extends State<StudentScreen> {
  Database? db;
  List<Map<String, dynamic>> students = [];

  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();

  Future<void> initDatabase() async {
    String dbPath = join(await getDatabasesPath(), "crud_student.db");

    db = await openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
          "CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT, age INTEGER)",
        );
      },
    );

    loadData();
  }

  Future<void> loadData() async {
    students = await db!.query("student");
    setState(() {});
  }

  Future<void> insertData() async {
    await db!.insert("student", {
      "name": nameController.text,
      "age": int.parse(ageController.text),
    });

    nameController.clear();
    ageController.clear();

    loadData();
  }

  Future<void> updateData(int id) async {
    await db!.update(
      "student",
      {
        "name": nameController.text,
        "age": int.parse(ageController.text),
      },
      where: "id = ?",
      whereArgs: [id],
    );

    nameController.clear();
    ageController.clear();

    loadData();
  }

  Future<void> deleteData(int id) async {
    await db!.delete(
      "student",
      where: "id = ?",
      whereArgs: [id],
    );

    loadData();
  }

  @override
  void initState() {
    super.initState();
    initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Student CRUD App"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: nameController,
              decoration: InputDecoration(
                labelText: "Student Name",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: ageController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Student Age",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: insertData,
            child: Text("Add Student"),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(students[index]["name"]),
                  subtitle: Text("Age: ${students[index]["age"]}"),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () {
                          nameController.text = students[index]["name"];
                          ageController.text =
                              students[index]["age"].toString();

                          updateData(students[index]["id"]);
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          deleteData(students[index]["id"]);
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
