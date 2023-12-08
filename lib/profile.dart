import 'package:flutter/material.dart';
import 'privacy.dart';


class Post {
  final String profilePic;
  final String name;
  final String timeAgo;
  final String caption;
  final String im;

  Post({
    required this.profilePic,
    required this.name,
    required this.timeAgo,
    required this.caption,
    required this.im,
  });
}


class PostWidget extends StatelessWidget {
  
  final Post post = Post(
    profilePic: "assets/im/abd.jpeg",
    name: "Abdullah Mazher",
    timeAgo: "9h ago",
    caption: "Enjoying coding with Flutter! #FlutterDev",
    im: 'assets/im/faraz.jpeg',
  );

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(post.profilePic),
          ),
          title: Text(post.name),
          subtitle: Text(post.timeAgo),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            post.caption,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
        Image.asset(
          post.im,
          fit: BoxFit.cover,
          width: double.infinity,
          height: 200.0,
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconWithText(icon: Icons.thumb_up, label: 'Like'),
            IconWithText(icon: Icons.comment, label: 'Comment'),
            IconWithText(icon: Icons.share, label: 'Share'),
          ],
        ),
        SizedBox(height: 16.0),
      ],
    );
  }
}

class IconWithText extends StatelessWidget {
  final IconData icon;
  final String label;

  IconWithText({
    required this.icon,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        SizedBox(width: 4.0),
        Text(label),
      ],
    );
  }
}

class Profile {
  String password;
  String name;
  String bio;
  String profilePic;

  Profile({
    required this.password,
    required this.name,
    required this.bio,
    required this.profilePic,
  });
}

class ProfilePage extends StatelessWidget {
  Profile userProfile = Profile(
    password: "password",
    name: "Abdullah Mazher",
    bio: "Flutter Developer",
    profilePic: "assets/im/abd.jpeg",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: AssetImage(userProfile.profilePic),
              ),
              SizedBox(height: 16.0),
              Text(
                userProfile.name,
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.0),
              Text(
                userProfile.bio,
                style: TextStyle(
                  fontSize: 16.0,
                ),
              ),
              SizedBox(height: 16.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ProfileIcon(
                    icon: Icons.people,
                    label: 'Friends',
                    onClick: () {
                      // Add your onClick logic for 'Friends' here
                    },
                  ),
                  ProfileIcon(
                    icon: Icons.person,
                    label: 'Profile',
                    onClick: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PrivacyPage(
                            userProfile: userProfile,
                            onSave: (Profile updatedProfile) {
                              userProfile = updatedProfile;
                            },
                          ),
                        ),
                      );
                    },
                  ),
                  ProfileIcon(
                    icon: Icons.privacy_tip,
                    label: 'Privacy',
                    onClick: () {
                      // Add your onClick logic for 'Profile' here
                    },
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              PostWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileIcon extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onClick;

  ProfileIcon({
    required this.icon,
    required this.label,
    required this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Column(
        children: [
          Icon(
            icon,
            size: 30.0,
            color: Colors.blue,
          ),
          SizedBox(height: 8.0),
          Text(
            label,
            style: TextStyle(
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}
