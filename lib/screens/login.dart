import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

// importing the buttton and text field classes we built
import '../components/my_button.dart';
import '../components/my_text_field.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  const LoginPage({super.key, this.onTap});

  /*This is different from our button and text field.
  *purpose: When we call LoginPage() we want it tto reset each time
  * maybe a user signed in one time and know that information is known to LoginPage
  * but if we return to LoginPage, we shouldn't remember that information.
  * so we should create a new state everytime we call this class
  */

  State<LoginPage> createState() => _LoginState();
}

class _LoginState extends State<LoginPage> {
  //Another Dart Widget that serves as a text box contrtoller keeping track of the text we input
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  // calls firebase authorization to sign in and if successfull returns
  //user creds else returns and error
  Future<void> signIn() async {
    final auth = Provider.of<AuthService>(context, listen: false);
    try {
      await auth.signInWithCreds(emailController.text, passwordController.text);
      print("sign in ");
    } catch (e) {
      //show error msg at bottom of screen
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("sign in login + e.toString()")));
    }
  }

  @override
  Widget build(BuildContext context) {
    /* Scaffold is a widget that will occupy the whole screen and we can insert functitonality
    *in it 
    * It has many properties but here we'll focus on 'body:' which displays the main page
    * for more information on Scaffold: https://www.geeksforgeeks.org/scaffold-class-in-flutter-with-examples/
    * in body, we can call organization toold like Column to format the widgets onto tthe screen
    * Widgetts are placed in the order you mention them (top to bottom on app)
    */
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
              height: 50), //Let's add padding at tthe top of the page.
          Icon(
            //Built in widget that displays a message icon
            Icons.message,
            size: 80,
          ),
          const Text(
            //We want this at the top so we'll place it first
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
          const SizedBox(
              height:
                  10), //lets leave a gap between the email textbox and password
          MyTextField(
            controller: passwordController,
            hintText: "password",
            obscureText: true,
          ),
          //enter info and signin (calls sign in in this file)
          MyButton(onTap: signIn, text: "Sign in"),

          /* Another way to add buttons though less modular 
          * This class in particular stacks text row-wise 
          * We're centering the text using MainAxisAlignment.center
          * and the text we're inserting and formatting are the "children"
          */
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
