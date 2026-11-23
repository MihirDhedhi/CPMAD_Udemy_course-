import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Row Column Container"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 100,
              width: 100,
              color: Colors.red,
              child: Center(
                child: Text(
                  "Container 1",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  color: Colors.green,
                  child: Center(
                    child: Text("Box 1"),
                  ),
                ),

                SizedBox(width: 10),

                Container(
                  height: 80,
                  width: 80,
                  color: Colors.orange,
                  child: Center(
                    child: Text("Box 2"),
                  ),
                ),

                SizedBox(width: 10),

                Container(
                  height: 80,
                  width: 80,
                  color: Colors.purple,
                  child: Center(
                    child: Text(
                      "Box 3",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
