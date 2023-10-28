import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screlmachinetest/view/userexplain.dart';
import 'package:screlmachinetest/viewmodel/provider.dart';
import '../model/model.dart'; // Import your model

class UserList extends StatelessWidget {
  final List<Welcome> users; // List of Welcome objects

  UserList(this.users);

  @override
  Widget build(BuildContext context) {
    final Users = Provider.of<PostProvider>(context);

    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return ListTile(
          title: Text(user.name),
          subtitle: Text(user.email),
          onTap: () {
            // When tapped, navigate to the details screen and pass the user object
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => UserDetails(user),
              ),
            );
          },
        );
      },
    );
  }
}
