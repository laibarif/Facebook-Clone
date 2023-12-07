import 'package:flutter/material.dart';
import 'profile.dart';
import 'chats.dart';

class Post {
  final String content;

  Post({required this.content});
}

class User {
  final String name;
  final String profilePicture;

  User({required this.name, required this.profilePicture});
}

class Interface extends StatefulWidget {
  final String myToken;

  Interface({required this.myToken});

  @override
  _InterfaceState createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  final List<Post> posts = [];
  TextEditingController _textEditingController = TextEditingController();

  void _showOptionsMenu() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Menu',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              _buildOptionItem(Icons.event, 'Events', Colors.blue),
              _buildOptionItem(Icons.group, 'Groups', Colors.green),
              _buildOptionItem(Icons.chat, 'Chats', Colors.orange),
              _buildOptionItem(Icons.people, 'Friends', Colors.purple),
              _buildOptionItem(Icons.group, 'Users', Colors.teal),
              _buildOptionItem(Icons.email, 'Email', Colors.red),
              _buildOptionItem(Icons.person, 'Profile', Colors.indigo),
              _buildOptionItem(Icons.logout, 'Logout', Colors.red),
            ],
          ),
        );
      },
    );
  }

  Widget _buildOptionItem(IconData icon, String label, Color color) {
    return ListTile(
      leading: Icon(icon, color: color),
      title: Text(
        label,
        style: TextStyle(color: color),
      ),
      onTap: () {
        Navigator.pop(context);
        if (label == "Logout") {}
        if (label == "Profile") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        }
        if (label == "Chats") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Mychats()),
          );
        }
        if (label == "Users") {

        }
      },
    );
  }

  User? loggedInUser;

  @override
  void initState() {
    super.initState();
    loggedInUser = User(name: 'Abdullah', profilePicture: 'assets/im/abd.jpeg');
  }

  void _postMessage() {
    String enteredText = _textEditingController.text;
    if (enteredText.isNotEmpty) {
      setState(() {
        posts.add(Post(content: enteredText));
        _textEditingController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // Removed the dark theme for simplicity
      home: Scaffold(
        appBar: AppBar(
          title: loggedInUser != null
              ? Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage(loggedInUser!.profilePicture),
                    ),
                    SizedBox(width: 8.0),
                    Text(loggedInUser!.name),
                  ],
                )
              : Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.menu),
              onPressed: () {
                _showOptionsMenu();
              },
            ),
            IconButton(
              icon: Icon(Icons.message),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.logout),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _textEditingController,
                      decoration: InputDecoration(
                        hintText: 'Type something...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: () {
                      //call the function here
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: _postMessage,
                  ),
                  IconButton(
                    icon: Icon(Icons.post_add),
                    onPressed: () {},
                  ),
                ],
              ),
            ),

            // Additional space above and below the free space for posts
            SizedBox(height: 16.0),
            // Free space for posts
            Expanded(
              child: posts.isNotEmpty
                  ? ListView.separated(
                      itemCount: posts.length,
                      separatorBuilder: (context, index) =>
                          SizedBox(height: 16.0),
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // User information
                            Row(
                              children: [
                                SizedBox(width: 10),
                                CircleAvatar(
                                  backgroundImage:
                                      AssetImage(loggedInUser!.profilePicture),
                                ),
                                SizedBox(width: 10),
                                Column(children: [
                                  Text(loggedInUser!.name),
                                  SizedBox(height: 2),
                                  Text(
                                    getTimeAgo(DateTime.now()),
                                    style: TextStyle(
                                      fontSize: 10.0,
                                      fontWeight: FontWeight.w100,
                                    ),
                                  ),
                                ])
                              ],
                            ),
                            // Post content
                            SizedBox(height: 10),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(post.content),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                _buildHoverableIcon(Icons.thumb_up, 'Like'),
                                _buildHoverableIcon(Icons.comment, 'Comment'),
                                _buildHoverableIcon(Icons.share, 'Share'),
                              ],
                            ),
                            SizedBox(height: 4),
                            Row(
                              children: [
                                SizedBox(width: 10),
                                Text(
                                  'View Comments',
                                  style: TextStyle(
                                    color: Colors.blue,
                                    fontStyle: FontStyle.normal,
                                  ),
                                ),
                              ],
                            )
                          ],
                        );
                      },
                    )
                  : Center(
                      child: Text('No posts yet.'),
                    ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ProfilePage()),
            );
          },
          child: Icon(Icons.person),
        ),
      ),
    );
  }

  Widget _buildHoverableIcon(IconData icon, String label) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: AnimatedContainer(
        duration: Duration(milliseconds: 200),
        padding: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.transparent, // Change background color on hover
        ),
        child: IconWithText(
          icon: icon,
          label: label,
        ),
      ),
      onEnter: (_) {
        setState(() {
          Color: Colors.transparent;
          Size(25, 25);
        });
      },
      onExit: (_) {
        setState(() {
          Color: Colors.blue;
          Size(10, 10);
        });
      },
    );
  }
}
String getTimeAgo(DateTime postTime) {
  DateTime currentTime = DateTime.now();
  Duration difference = currentTime.difference(postTime);

  if (difference.inDays > 0) {
    return '${difference.inDays}d ago';
  } else if (difference.inHours > 0) {
    return '${difference.inHours}h ago';
  } else if (difference.inMinutes > 0) {
    return '${difference.inMinutes}m ago';
  } else {
    return 'Just now';
  }
}


