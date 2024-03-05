import 'package:acmw_weather_demo/screens/login.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:acmw_weather_demo/screens/reg.dart';
import 'package:acmw_weather_demo/services/auth/auth_gate.dart';
import 'package:acmw_weather_demo/firebase_options.dart';
// Like our main function in other lanugages. Initizlizes widgets then runs the App class
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // everry class must have this method build which "builds" the app with the code you've
  // put inside. Think of this like another main()
  @override
  Widget build(BuildContext context) {
    //try adding to search

    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      //this is what we'll see when we open the app
      home: AuthGate(),
    );
  }
}
