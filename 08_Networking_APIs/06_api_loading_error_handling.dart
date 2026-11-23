// 06 - API Loading and Error Handling
// Add http package in pubspec.yaml.

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<List<dynamic>> fetchPosts() async {
    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts'),
    );

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    }
    throw Exception('Server returned ${response.statusCode}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Loading and Error')),
        body: FutureBuilder<List<dynamic>>(
          future: fetchPosts(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            }
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 40),
                    Text('${snapshot.error}'),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Text('Retry (restart app)'),
                    ),
                  ],
                ),
              );
            }
            return ListView(
              children: snapshot.data!
                  .map((post) => ListTile(title: Text(post['title'])))
                  .toList(),
            );
          },
        ),
      ),
    );
  }
}
