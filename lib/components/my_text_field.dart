import 'package:flutter/material.dart';

/* Now we want a place where the user can type info
* What do we need: 
  1) A textbox to type in
  2) Hint Text to specify to the user what should go in the box
  3) If the box is intended to hold something we don't want to show (like a password)
      we can "obscure text" so it shows up as black dots
*/
class MyTextField extends StatelessWidget {
  final TextEditingController controller; //text box
  final String hintText; //hint text
  final bool obscureText; // obscure text
  //consttructor
  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    //We want a text field so we can call Dart's TextField widget and use the parameters in the
    // documentation and our defined arguments as arguments
    return TextField(
      controller:
          controller, //first one is paramter from documentattion, 2nd is our argument from constructor
      obscureText: obscureText,
      //apply borders, hintText, colors, etc using another Dart Widget
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.black38),
        ),
        focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.cyan)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.black, height: 1),
      ),
    );
  }
}
