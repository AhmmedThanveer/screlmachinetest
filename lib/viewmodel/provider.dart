import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
// import 'model.dart';

class PostProvider with ChangeNotifier {
  List<Welcome> _data = [];
  bool _isLoading = true;

  List<Welcome> get data => _data;
  bool get isLoading => _isLoading;

  Future<void> fetchData() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      _data = jsonData.map((item) => Welcome.fromJson(item)).toList();
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
