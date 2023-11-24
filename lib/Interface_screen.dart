import 'package:flutter/material.dart';

class Friend {
  final String name;
  final String profilePicture;

  Friend({required this.name, required this.profilePicture});
}

class Interface extends StatelessWidget {
  final List<Friend> friends = [
    Friend(name: 'Abdullah', profilePicture: 'assets/im/abd.jpeg'),
    Friend(name: 'Muaaz', profilePicture: 'assets/im/muaaz.jpeg'),
    Friend(name: 'Abu Bakar', profilePicture: 'assets/im/abd.jpeg'),
    Friend(name: 'Umair Bhai', profilePicture: 'assets/im/umair.jpeg'),
    Friend(name: 'Saad Akbar', profilePicture: 'assets/im/saad.jpeg'),
    Friend(name: 'Syed Faraz', profilePicture: 'assets/im/faraz.jpeg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Add your search functionality here
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage(friend.profilePicture),
            ),
            title: Text(friend.name),
            trailing: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                // Add your delete functionality here
              },
            ),
          );
        },
      ),
    );
  }
}
