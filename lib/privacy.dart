import 'package:flutter/material.dart';
import 'profile.dart';

class PrivacyPage extends StatelessWidget {
  final Profile userProfile;
  final void Function(Profile updatedProfile) onSave;

  PrivacyPage({
    required this.userProfile,
    required this.onSave,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController _nameController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _bioController = TextEditingController();

    // Initialize the text controllers with the current user profile data
    _nameController.text = userProfile.name;
    _passwordController.text = userProfile.password;
    _bioController.text = userProfile.bio;

    return Scaffold(
      appBar: AppBar(
        title: Text('Privacy'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 70,
              backgroundImage: AssetImage(userProfile.profilePic),
            ),
            SizedBox(height: 15),
            Icon(Icons.camera_alt, size: 30,),
            SizedBox(height: 10),
            // Text fields for changing name, password, and bio
            _buildTextField("Name", _nameController),
            _buildTextField("Password", _passwordController),
            _buildTextField("Bio", _bioController),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update the user profile and invoke the onSave callback
                Profile updatedProfile = Profile(
                  name: _nameController.text,
                  password: _passwordController.text,
                  bio: _bioController.text,
                  profilePic: userProfile.profilePic,
                );

                onSave(updatedProfile);


                // Navigate back to the previous screen (ProfilePage)
                Navigator.pop(context);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
