import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/model.dart';
import '../viewmodel/provider.dart';

class UserDetails extends StatelessWidget {
  final Welcome user;

  UserDetails(this.user);

  @override
  Widget build(BuildContext context) {
    final Users = Provider.of<PostProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${user.name}"),
            Text("Email: ${user.email}"),
            Text("Street: ${user.address.street}"),
            Text("Suite: ${user.address.suite}"),
            Text("City: ${user.address.city}"),
            Text("Zipcode: ${user.address.zipcode}"),
            Text("Geo - Lat: ${user.address.geo.lat}"),
            Text("Geo - Lng: ${user.address.geo.lng}"),
            Text("Phone: ${user.phone}"),
            Text("Website: ${user.website}"),
            Text("Company: ${user.company.name}"),
            Text("Catch Phrase: ${user.company.catchPhrase}"),
            Text("BS: ${user.company.bs}"),
          ],
        ),
      ),
    );
  }
}
