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
      home: ReactiveScreen(),
    );
  }
}

class ReactiveScreen extends StatelessWidget {
  ReactiveScreen({super.key});

  final name = "Mihir".obs;

  void changeName() {
    name.value = "Flutter Student";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Reactive Variable"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  "Name: ${name.value}",
                  style: TextStyle(fontSize: 25),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: changeName,
              child: Text("Change Name"),
            ),
          ],
        ),
      ),
    );
  }
}
