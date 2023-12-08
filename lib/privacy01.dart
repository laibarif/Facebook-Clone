import 'package:flutter/material.dart';

class UserPrivacy extends StatefulWidget {
  @override
  _UserPrivacyState createState() => _UserPrivacyState();
}

class _UserPrivacyState extends State<UserPrivacy> {
  bool isAccountPublic = true;
  bool canReceiveMessages = true;
  bool canInteractWithPosts = true;
  bool canLikeComments = true;
  bool canCommentOnPosts = true;
  bool canSharePosts = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Account Visibility',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Row(
              children: [
                Radio(
                  value: true,
                  groupValue: isAccountPublic,
                  onChanged: (value) {
                    setState(() {
                      isAccountPublic = true;
                    });
                  },
                ),
                Text('Public'),
                SizedBox(width: 20),
                Radio(
                  value: false,
                  groupValue: isAccountPublic,
                  onChanged: (value) {
                    setState(() {
                      isAccountPublic = false;
                    });
                  },
                ),
                Text('Private'),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Messaging Permissions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Receive Messages'),
              value: canReceiveMessages,
              onChanged: (value) {
                setState(() {
                  canReceiveMessages = value!;
                });
              },
            ),
            SizedBox(height: 20),
            Text(
              'Post Interaction Permissions',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            CheckboxListTile(
              title: Text('Like Comments'),
              value: canLikeComments,
              onChanged: (value) {
                setState(() {
                  canLikeComments = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Comment on Posts'),
              value: canCommentOnPosts,
              onChanged: (value) {
                setState(() {
                  canCommentOnPosts = value!;
                });
              },
            ),
            CheckboxListTile(
              title: Text('Share Posts'),
              value: canSharePosts,
              onChanged: (value) {
                setState(() {
                  canSharePosts = value!;
                });
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Handle save button press, save the privacy settings
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: UserPrivacy(),
  ));
}
