import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:screlmachinetest/view/userexplain.dart';
import 'package:screlmachinetest/viewmodel/provider.dart';
import '../model/model.dart';

class UserList extends StatelessWidget {
  final List<Welcome> users;

  UserList(this.users);

  @override
  Widget build(BuildContext context) {
    final Users = Provider.of<PostProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('User List'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Show the search bar or perform search action
            },
          ),
        ],
        bottom: PreferredSize(
          preferredSize:
              Size.fromHeight(48.0), // Define the height of the search bar
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                labelText: 'Search',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (query) {
                // Handle search query changes
                // You can filter the user list based on the search query here
              },
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: users.length * 2 - 1,
        itemBuilder: (context, index) {
          if (index.isOdd) {
            final itemIndex = index ~/ 2;
            return Divider();
          } else {
            final itemIndex = index ~/ 2;
            final user = users[itemIndex];
            return ListTile(
              title: Text(user.name),
              subtitle: Text(user.email),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => UserDetails(user),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
