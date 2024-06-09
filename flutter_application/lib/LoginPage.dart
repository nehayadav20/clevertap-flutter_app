import 'package:flutter/material.dart';
import 'package:clevertap_plugin/clevertap_plugin.dart';
import 'app_inbox.dart'; // Import the app inbox page file

class LoginPage extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController identityController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
 // String? selectedGender;
  void _handleSignin(BuildContext context) {
    String name = nameController.text;
    String email = emailController.text;
    String phone = phoneController.text;
    String identity = identityController.text;
    String gender = genderController.text;
    var myStuff = ["bag", "shoes"];
    var props = {
      'Name': name,
      'Identity': identity,
      'Email': email,
      'Phone': phone,
      'Gender': gender,
      'Stuff': myStuff,
      'MSG-push': true,
    };
    CleverTapPlugin.onUserLogin(props);
    // Navigate to the app inbox page after sign in
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AppInboxPage()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Name'),
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: phoneController,
              decoration: const InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 5),
            TextFormField(
              controller: identityController,
              decoration: const InputDecoration(labelText: 'Username'),
            ),
            const SizedBox(height: 5),
             TextFormField(
              controller: genderController,
              decoration: const InputDecoration(labelText: 'gender'),
            ),
            ElevatedButton(
              onPressed: () {
                _handleSignin(context);
              },
              child: const Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}




