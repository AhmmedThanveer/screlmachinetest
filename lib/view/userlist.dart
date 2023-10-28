import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screlmachinetest/view/userexplain.dart';
import '../viewmodel/provider.dart';

class UserListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<PostProvider>(context).data;

    return Scaffold(
      appBar: AppBar(
        title: Text('Users name List'),
        backgroundColor: Colors.black,
      ),
      body: ListView.separated(
        itemCount: users.length,
        separatorBuilder: (context, index) =>
            Divider(thickness: 2), // Add dividers here
        itemBuilder: (context, index) {
          final user = users[index];
          return ListTile(
            title: Text(user.name),
            subtitle: Text(user.email),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UserDetailsPage(user),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
