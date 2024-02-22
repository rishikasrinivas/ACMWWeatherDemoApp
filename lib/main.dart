import 'package:acmw_weather_demo/screens/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:acmw_weather_demo/screens/reg.dart';
import 'package:acmw_weather_demo/screens/login.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

//will get called repeatedly
class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    //try adding to search

    return const MaterialApp(
      debugShowCheckedModeBanner: false,

      //called over and over again so after you login it'll
      //call AuthGate with updated info
      home: LoginPage(),
    );
  }
}
