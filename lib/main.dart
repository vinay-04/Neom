import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:googleauth/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'googleAuth',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amberAccent,
        primarySwatch: Colors.purple,
      ),
      home: LoginScreen(),
    );
  }
}
