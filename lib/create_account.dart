import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'configuration.dart';
import 'BL.dart';


List<Profile> userList = [];
class CreateAccountScreen extends StatelessWidget {
  
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create-Account'),
      ),
      body: Center(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.facebook,
                size: 40.0,
                color: Colors.blue,
              ),
              Text(
                'Facebook-Clone',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                  fontWeight: FontWeight.w900,
                ),
              ),
              SizedBox(height: 16.0),
              NameTextBox(controller: nameController),
              SizedBox(height: 16.0),
              EmailTextBox(controller: emailController),
              SizedBox(height: 16.0),
              PasswordTextBox(controller: passwordController),
              SizedBox(height: 16.0),
              ConfirmPasswordBox(controller: passwordController),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  String name = nameController.text;
                  String email = emailController.text;
                  String password = passwordController.text;
                  registerUser(name, email, password);
                  displayMessage(context,
                      'Account has been created $name, $email, $password');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                  side: BorderSide(
                    color: Colors.blue,
                    width: 2.0,
                  ),
                ),
                child: Text(
                  'Create Account',
                  style: TextStyle(
                    color: Colors.blue,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void displayMessage(BuildContext context, String message) {
  final snackBar = SnackBar(
    content: Text(message),
    duration: Duration(seconds: 2),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class NameTextBox extends StatelessWidget {
  final TextEditingController controller;

  NameTextBox({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your Name',
        labelText: 'Name',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class EmailTextBox extends StatelessWidget {
  final TextEditingController controller;

  EmailTextBox({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your Username',
        labelText: 'Username',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class PasswordTextBox extends StatelessWidget {
  final TextEditingController controller;

  PasswordTextBox({required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Enter your Password',
        labelText: 'Password',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}

class ConfirmPasswordBox extends StatefulWidget {
  final TextEditingController controller;

  ConfirmPasswordBox({required this.controller});

  @override
  _ConfirmPasswordBoxState createState() => _ConfirmPasswordBoxState();
}

class _ConfirmPasswordBoxState extends State<ConfirmPasswordBox> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Enter your Password',
        labelText: 'Confirm Password',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  String getPassword() {
    return widget.controller.text;
  }
}

void registerUser(String name, String email, String password) async {
  try {
    var regBody = {"name": name, "email": email, "password": password};
    var response = await http.post(
      Uri.parse('http://localhost:3000/api/registration'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regBody),
    );

    // Handle the response 
    print("Response status: ${response.statusCode}");
    print("Response body: ${response.body}");
    final Profile User = Profile(
      myname: "$name",
      myemail: "$email",
      mypassword: "$password",
      mybio: "Flutter Developer",
      mypic: " ",
    );
    userList.add(User);
  } catch (e) {
    print("Error: $e");
  }
}
