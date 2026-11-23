// 02 - HTTP GET Request
// Add the http package in pubspec.yaml:
// dependencies:
//   http: ^1.2.0

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<String> getData() async {
    final url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      return 'Request failed: ${response.statusCode}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('HTTP GET')),
        body: Center(
          child: FutureBuilder<String>(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return Padding(
                padding: const EdgeInsets.all(16),
                child: Text(snapshot.data ?? 'No data'),
              );
            },
          ),
        ),
      ),
    );
  }
}
