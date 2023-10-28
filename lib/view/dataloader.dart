import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:screlmachinetest/view/userlist.dart';

import '../viewmodel/provider.dart';

class DataLoader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postProvider = Provider.of<PostProvider>(context);

    // Check if data is loading and fetch it if necessary
    if (postProvider.isLoading) {
      postProvider.fetchData();
    }

    // Return the widget that will display the data
    return UserListPage();
  }
}
