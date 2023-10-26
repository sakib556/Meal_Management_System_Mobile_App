import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<List<Map<String, dynamic>>?> fetchData() async {
    final response = await http.get(
        Uri.parse('https://mealmanagement556.000webhostapp.com/all_user.php'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return List<Map<String, dynamic>>.from(jsonData);
    } else {
      throw Exception('Failed to load data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>?>(
      future: fetchData(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Text('Error: ${snapshot.error}');
        } else if (snapshot.hasData) {
          final userData = snapshot.data!;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: userData.map((item) {
                return Card(
                  child: ListTile(
                    title: Text('User ID: ${item['user_id']}'),
                    subtitle: Text('User Name: ${item['user_name']}'),
                    // You can add more fields as needed
                  ),
                );
              }).toList(),
            ),
          );
        } else {
          return const Text('No data found');
        }
      },
    );
  }
}
