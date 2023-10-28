import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:your_app_name/model/model.dart';

import '../model/model.dart';
import '../viewmodel/provider.dart'; // Import your model

class UserDetailsPage extends StatelessWidget {
  final Welcome user;

  UserDetailsPage(this.user);

  @override
  Widget build(BuildContext context) {
    final locationProvider = Provider.of<UserLocationProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}'),
            Text('Email: ${user.email}'),
            Text('Phone: ${user.phone}'),
            Text('Website: ${user.website}'),
            ListTile(
              title: Text('Current Location:'),
              subtitle: Consumer<UserLocationProvider>(
                builder: (context, userLocation, child) {
                  if (userLocation.location == null) {
                    // Location not available yet
                    return SizedBox(
                        width: 10,
                        child: Center(child: CircularProgressIndicator()));
                  }
                  final location = userLocation.location!;
                  return Text(
                      'Lat: ${location.latitude}, Lng: ${location.longitude}');
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                locationProvider.updateUserLocation();
              },
              child: Text('Update Location'),
            ),
          ],
        ),
      ),
    );
  }
}
