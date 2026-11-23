import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: SnackDialogScreen(),
    );
  }
}

class SnackDialogScreen extends StatelessWidget {
  SnackDialogScreen({super.key});

  void showSnack() {
    Get.snackbar(
      "Success",
      "Button clicked successfully!",
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  void showAlert() {
    Get.dialog(
      AlertDialog(
        title: Text("Confirmation"),
        content: Text("Do you want to continue?"),
        actions: [
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("Cancel"),
          ),
          TextButton(
            onPressed: () {
              Get.back();
            },
            child: Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Snackbar & Dialog"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: showSnack,
              child: Text("Show Snackbar"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: showAlert,
              child: Text("Show Dialog"),
            ),
          ],
        ),
      ),
    );
  }
}
