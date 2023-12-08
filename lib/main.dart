import 'package:flutter/material.dart';
import 'create_account.dart';
import 'Interface_screen.dart';
import 'profile.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
bool flag = true;
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Facebook-Login'),
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
                EmailTextBox(controller: emailController),
                SizedBox(height: 16.0),
                PasswordTextBox(controller: passwordController),
                SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      try {
                        navigatorKey.currentState!.pushNamed('/createAccount');
                      } catch (e) {
                        print('Error navigating to Create Account: $e');
                      }
                    },
                    child: Text(
                      'Create Account',
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16.0),
                ElevatedButton(
                  onPressed: () {
                    LoginUser(emailController.text, passwordController.text);
                    if(!flag){
                      displayMessage(context, "Invalid Username or Password");
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    side: BorderSide(
                      color: Colors.blue,
                      width: 2.0,
                    ),
                  ),
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      routes: {
        '/createAccount': (context) => CreateAccountScreen(),
        '/interface': (context) => Interface(myToken: 'yourTokenValue'),
        '/profile': (context) => ProfilePage(),
      },
    );
  }
}

void LoginUser(String email, password) async {
  try {
    var regBody = {"email": email, "password": password};
    var response = await http.post(
      Uri.parse('http://localhost:3000/api/login'),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode(regBody),
    );

    var jsonResponse = jsonDecode(response.body);
    if (jsonResponse['status']) {
      var myToken = jsonResponse['token'];
      try {
        navigatorKey.currentState!.pushNamed('/interface', arguments: myToken);
      } catch (e) {
        print('Error navigating to Interface: $e');
      }
    }
    else{
      flag = false;
    }
  } catch (e) {
    print("error: $e");
  }
}
