import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController repeatPasswordController = TextEditingController();

  bool passwordsMatch = true;

  void checkPasswords() {
    setState(() {
      passwordsMatch = passwordController.text == repeatPasswordController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
              ),
            ),
            const SizedBox(height: 20.0),
            TextFormField(
              controller: usernameController,
              decoration: const InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
              onChanged: (value) {
                checkPasswords();
              },
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: repeatPasswordController,
              decoration: InputDecoration(
                labelText: 'Repeat Password',
                errorText: passwordsMatch ? null : "Passwords don't match",
              ),
              obscureText: true,
              onChanged: (value) {
                checkPasswords();
              },
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                if (passwordsMatch) {
                  // Here you can implement the sign-up logic
                  // For simplicity, I'm just printing the input values
                  print('Email: ${emailController.text}');
                  print('Username: ${usernameController.text}');
                  print('Password: ${passwordController.text}');
                  // Add your sign-up logic here
                }
              },
              child: Text('Sign me up!'),
            ),
          ],
        ),
      ),
    );
  }
}