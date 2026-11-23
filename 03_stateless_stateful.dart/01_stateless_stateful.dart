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
          title: Text("Stateless and Stateful"),
          backgroundColor: Colors.blue,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MyText(),
            CounterApp(),
          ],
        ),
      ),
    );
  }
}

// Stateless Widget
class MyText extends StatelessWidget {
  MyText({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "This is Stateless Widget",
      style: TextStyle(fontSize: 20),
    );
  }
}

// Stateful Widget
class CounterApp extends StatefulWidget {
  CounterApp({super.key});

  @override
  State<CounterApp> createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20),
        Text(
          "Counter: $count",
          style: TextStyle(fontSize: 25),
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
          child: Text("Increase"),
        ),
      ],
    );
  }
}
