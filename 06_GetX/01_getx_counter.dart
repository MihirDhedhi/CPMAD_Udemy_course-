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
      home: CounterScreen(),
    );
  }
}

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  final count = 0.obs;

  void increase() {
    count.value++;
  }

  void decrease() {
    count.value--;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Counter"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  "Counter: ${count.value}",
                  style: TextStyle(fontSize: 30),
                )),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: decrease,
                  child: Text("-"),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: increase,
                  child: Text("+"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
