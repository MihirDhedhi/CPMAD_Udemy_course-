// 01 - API Introduction
// API means Application Programming Interface.
// This is a simple example showing data that could come from an API.

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('API Introduction')),
        body: const Center(
          child: Text(
            'API helps apps communicate with other services.',
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
