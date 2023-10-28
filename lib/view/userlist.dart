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

    return ListView.builder(
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
    );
  }
}
