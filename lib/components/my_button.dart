import 'package:flutter/material.dart';

/* We want 2 things in a button. The name of the button so the user knows its purpose
 * and some functionalityt behind that button. Let's generalize that here 
 */
class MyButton extends StatelessWidget {
  //our functionality behind the method will be defined by a method
  final void Function()? onTap;
  //text associated w/ button
  final String text;
  //build the constructor
  const MyButton({
    super.key, //calling the SttatelessWidget class' super
    required this.onTap,
    required this.text,
  });

  //what do we want this Button to do when we call it
  @override
  Widget build(BuildContext context) {
    // Detect a gesture so we can call the Dart Widget GestureDetector and associate
    // each of its properties (onTap, child, etc) to some functionality
    return GestureDetector(
      onTap:
          onTap, //first onTap is the parameter of the object, 2nd is our constructor defined variable
      //we want to build a box to hold text, then put text in it
      child: Container(
        //box to hold text
        decoration: BoxDecoration(
          color: Colors.black,
        ),
        child: Center(
            //We want to position the text in the center of the box
            child: Text(text, //the text we want to place
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ))),
      ),
    );
  }
}
