import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:acmw_weather_demo/screens/search.dart';

import '../../screens/home.dart';
import '../login_or_reg.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const SearchPage();
            }
            //goes to login_or_reg
            return const LoginOrReg();
          }),
    );
  }
}