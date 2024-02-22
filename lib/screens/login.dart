import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../components/my_button.dart';
import '../components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, this.onTap});

  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // calls firebase authorization to sign in and if successfull returns
  //user creds else returns and error
  void signIn() async {
    print("Clicked Login!");
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Column(
        children: [
          Icon(
            Icons.message,
            size: 80,
          ),
          const Text(
            "Welcome back",
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          MyTextField(
            controller: emailController,
            hintText: "email",
            obscureText: false,
          ),
          const SizedBox(height: 10),
          MyTextField(
            controller: passwordController,
            hintText: "password",
            obscureText: true,
          ),
          //enter info and signin (calls sign in in this file)
          MyButton(onTap: signIn, text: "Sign in"),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('not member?'),
            SizedBox(width: 4),
            GestureDetector(
              onTap: widget.onTap,
              child: Text(
                'Register now',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ])
        ],
      ),
    );
  }
}
