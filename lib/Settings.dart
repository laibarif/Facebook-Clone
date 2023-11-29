import 'package:flutter/material.dart';
import 'profile.dart';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
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
  @override
  _InterfaceState createState() => _InterfaceState();
}

class _InterfaceState extends State<Interface> {
  bool isDarkTheme = false;

  final List<Post> posts = [];

  User? loggedInUser; // User who is currently logged in

  @override
  void initState() {
    super.initState();
    // Initialize the logged-in user
    loggedInUser =
        User(name: 'Abdullah', profilePicture: 'assets/im/abd.jpeg');
  }

  void _showPosts() {
    // Implement the logic to fetch user-specific posts
    // For now, let's add some dummy posts
    setState(() {
      posts.add(Post(content: 'This is a new post.'));
      posts.add(Post(content: 'Another post here.'));
    });
  }

  void _navigateToProfile() {
    navigatorKey.currentState!.pushNamed('/profile');
    print('Navigate to Profile');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: isDarkTheme ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        appBar: AppBar(
          title: loggedInUser != null
              ? Row(
                  children: [
                    CircleAvatar(
                      backgroundImage:
                          AssetImage(loggedInUser!.profilePicture),
                    ),
                    SizedBox(width: 8.0),
                    Text(loggedInUser!.name),
                  ],
                )
              : Text('Home'),
          actions: [
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () {
                
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
                      decoration: InputDecoration(
                        hintText: 'Type something...',
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.attach_file),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.send),
                    onPressed: () {},
                  ),
                  IconButton(
                    icon: Icon(Icons.post_add),
                    onPressed: () {
                      _showPosts();
                    },
                  ),
                ],
              ),
            ),
            // Additional space above and below the free space for posts
            SizedBox(height: 16.0),
            // Free space for posts
            Expanded(
              child: posts.isNotEmpty
                  ? ListView.builder(
                      itemCount: posts.length,
                      itemBuilder: (context, index) {
                        final post = posts[index];
                        return ListTile(
                          title: Text(post.content),
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
          onPressed: _navigateToProfile,
          child: Icon(Icons.person),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: Icon(
                    isDarkTheme ? Icons.light_mode : Icons.dark_mode),
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
       routes: {
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}
