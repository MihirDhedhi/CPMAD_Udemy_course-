import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DatePickerScreen(),
    );
  }
}

class DatePickerScreen extends StatefulWidget {
  DatePickerScreen({super.key});

  @override
  State<DatePickerScreen> createState() => _DatePickerScreenState();
}

class _DatePickerScreenState extends State<DatePickerScreen> {
  DateTime? selectedDate;

  void pickDate() async {
    DateTime? date = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (date != null) {
      setState(() {
        selectedDate = date;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Date Picker"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: pickDate,
              child: Text("Select Date"),
            ),

            SizedBox(height: 20),

            Text(
              selectedDate == null
                  ? "No date selected"
                  : "Selected Date: ${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}",
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
