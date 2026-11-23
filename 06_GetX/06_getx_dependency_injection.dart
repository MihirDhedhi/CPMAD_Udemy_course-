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
      home: HomeScreen(),
    );
  }
}

class MyController extends GetxController {
  var count = 0.obs;

  void increase() {
    count.value++;
  }
}

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final MyController controller = Get.put(MyController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Dependency Injection"),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(() => Text(
                  "Counter: ${controller.count.value}",
                  style: TextStyle(fontSize: 30),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: controller.increase,
              child: Text("Increase"),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                MyController c = Get.find();
                Get.snackbar(
                  "Current Value",
                  "Counter value is ${c.count.value}",
                  snackPosition: SnackPosition.BOTTOM,
                );
              },
              child: Text("Get Controller"),
            ),
          ],
        ),
      ),
    );
  }
}
