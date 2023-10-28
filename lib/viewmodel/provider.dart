import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screlmachinetest/view/userlist.dart';
import 'package:geolocator/geolocator.dart';
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
      final jsonData = json.decode(response.body) as List<dynamic>;
      _data = jsonData.map((item) => Welcome.fromJson(item)).toList();
      _isLoading = false;
      notifyListeners();
    } else {
      throw Exception('Failed to load data');
    }
  }

  int _selectedItemId = -1; // Initialize with -1 or any default value

  int get selectedItemId => _selectedItemId;

  void selectItem(int id) {
    _selectedItemId = id;
    notifyListeners();
  }
}
// import 'package:flutter/material.dart';

class UserLocationProvider with ChangeNotifier {
  Position? _location;

  Position? get location => _location;

  Future<void> updateUserLocation() async {
    try {
      final locationData = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      _location = locationData;
      notifyListeners();
    } catch (e) {
      print("Error getting user location: $e");
    }
  }
}
