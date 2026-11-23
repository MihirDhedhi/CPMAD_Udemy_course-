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

class CounterController extends GetxController {
  var count = 0.obs;

  void increase() {
    count++;
  }

  void decrease() {
    count--;
  }

  void reset() {
    count.value = 0;
  }
}

class CounterScreen extends StatelessWidget {
  CounterScreen({super.key});

  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX Controller"),
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
            ElevatedButton(
              onPressed: controller.decrease,
              child: Text("Decrease"),
            ),
            ElevatedButton(
              onPressed: controller.reset,
              child: Text("Reset"),
            ),
          ],
        ),
      ),
    );
  }
}
