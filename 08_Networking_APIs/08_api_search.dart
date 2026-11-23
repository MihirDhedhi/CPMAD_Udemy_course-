// 08 - API Search
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
    throw Exception('Failed to load posts');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SearchPage(fetchPosts: fetchPosts),
    );
  }
}

class SearchPage extends StatefulWidget {
  final Future<List<dynamic>> Function() fetchPosts;
  const SearchPage({super.key, required this.fetchPosts});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<dynamic> posts = [];
  List<dynamic> filteredPosts = [];
  bool loading = true;
  final TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  Future<void> loadPosts() async {
    try {
      posts = await widget.fetchPosts();
      filteredPosts = posts;
    } catch (e) {
      filteredPosts = [];
    }
    setState(() {
      loading = false;
    });
  }

  void searchPosts(String value) {
    setState(() {
      filteredPosts = posts.where((post) {
        return post['title"].toString().toLowerCase().contains(value.toLowerCase());
      }).toList();
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Search Posts')),
      body: loading
          ? const Center(child: CircularProgressIndicator())
          : Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: TextField(
                    controller: searchController,
                    onChanged: searchPosts,
                    decoration: const InputDecoration(
                      labelText: 'Search post title',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredPosts.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(filteredPosts[index]['title']),
                      );
                    },
                  ),
                ),
              ],
            ),
    );
  }
}
