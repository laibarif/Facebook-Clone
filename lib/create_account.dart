import 'package:flutter/material.dart';

class CreateAccountScreen extends StatelessWidget {
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
              NameTextBox(),
              SizedBox(height: 16.0),
              EmailTextBox(),
              SizedBox(height: 16.0),
              PasswordTextBox(),
              SizedBox(height: 16.0),
              ConfirmPasswordBox(),
              SizedBox(height: 16.0),
              ElevatedButton( 
                onPressed: () {
                  displayMessage(context, 'Account has been created');
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
  @override
  Widget build(BuildContext context) {
    return TextField(
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
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        hintText: 'Enter your Email',
        labelText: 'Email',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
class PasswordTextBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Enter your Password',
        labelText: 'Passowrd',
        prefixIcon: Icon(Icons.person),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
class ConfirmPasswordBox extends StatefulWidget {
  @override
  _ConfirmPasswordBoxState createState() => _ConfirmPasswordBoxState();
}

class _ConfirmPasswordBoxState extends State<ConfirmPasswordBox> {
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _passwordController, 
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
    return _passwordController.text;
  }
}
