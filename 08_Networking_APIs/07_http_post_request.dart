// 07 - HTTP POST Request
// Add http package in pubspec.yaml.

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> addPost() async {
    final response = await http.post(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'title': 'Flutter Learning',
        'body': 'This is a sample post created using POST request.',
        'userId': 1,
      }),
    );

    if (response.statusCode == 201) {
      return 'Post created successfully!\n${response.body}';
    } else {
      return 'Failed: ${response.statusCode}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('HTTP POST')),
        body: Center(
          child: FutureBuilder<String>(
            future: addPost(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(snapshot.data ?? 'No response'),
              );
            },
          ),
        ),
      ),
    );
  }
}
