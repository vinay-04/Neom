import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:googleauth/firebaseServices.dart';
import 'package:googleauth/screens/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.amberAccent,
        primarySwatch: Colors.purple,
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: size.width * 0.25),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.network("${FirebaseAuth.instance.currentUser!.photoURL}"),
                Text("${FirebaseAuth.instance.currentUser!.displayName}"),
                Text("${FirebaseAuth.instance.currentUser!.email}"),
                ElevatedButton(
                    onPressed: () async {
                      await FirebaseServices().googleSignout();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Row(
                      children: const [
                        Icon(Icons.send),
                        Spacer(),
                        Text("Signout"),
                      ],
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
