import 'package:flutter/material.dart';

class Friend {
  final String name;
  final String profilePicture;

  Friend({required this.name, required this.profilePicture});
}

class Interface extends StatefulWidget {
  @override
  _InterfaceState createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  bool isDarkTheme = false;

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
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                // Implement search functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {
                // Implement message functionality
              },
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                // Implement logout and switch to main functionality
              },
            ),
          ],
        ),
        body: Column(
          children: [
            // Type box and post button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Type something...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: () {
                      // Implement file selection functionality
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {
                      // Implement post functionality
                    },
                  ),
                ],
              ),
            ),
            // Additional space above and below the free space for posts
            SizedBox(height: 16.0),
            // Free space for posts
            Expanded(
              child: ListView.builder(
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
                        // Implement delete functionality
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            // Implement post action
          },
          child: Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(isDarkTheme ? Icons.light_mode : Icons.dark_mode),
                onPressed: () {
                  setState(() {
                    isDarkTheme = !isDarkTheme;
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(Interface());
}
