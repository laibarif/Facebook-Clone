import 'package:flutter/material.dart';

TextEditingController searchBox = TextEditingController();

class Mychats extends StatelessWidget {
  // Sample data for chat users
  final List<Map<String, String>> chatUsers = [
    {'name': 'John Doe', 'imageUrl': 'url_to_john_doe_image'},
    
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Chats',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        body: Column(
          children: [
            SizedBox(height: 20,),
            Text(
              'Messages',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 35),
            ),
            SizedBox(width: 16),
            Row(
              children: [
                SizedBox(width: 10,),
                Icon(Icons.search),
                SizedBox(width: 10,),
                Expanded(
                  child: TextField(
                    controller: searchBox,
                    decoration: InputDecoration(
                      hintText: 'Search',
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            SizedBox(width: 10),
            // List of chat users
            Expanded(
              child: ListView.builder(
                itemCount: chatUsers.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage('assets/im/abd.jpeg'),
                    ),
                    title: Text('Umm-e-Akbar'),
                    // Add your onTap logic for handling chat selection
                    onTap: () {
                      // Handle chat selection
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
