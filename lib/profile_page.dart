import 'package:flutter/material.dart';

const int itemCount = 20;

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // shows list
      // used
      itemCount: itemCount, //The number of items in the list.
      itemBuilder: (BuildContext context, int index) {
        //Widget with a function that it can call, when it wants to build an item
        return ListTile(
          title: Text('Item ${(index + 1)}'),
          leading: const Icon(Icons.person), //person icon before text
          trailing: const Icon(Icons.select_all), //select icon after icon
          onTap: () {
            debugPrint(
                'Item ${(index + 1)} selected'); //when items clicked, they are selected
          },
        );
      },
    );
  }
}
