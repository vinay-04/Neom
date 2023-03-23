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
            margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.25,
              vertical: size.height * 0.34,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: size.height * 0.052,
                  backgroundColor: Colors.purple,
                  child: CircleAvatar(
                    radius: size.height * 0.05,
                    backgroundImage: NetworkImage(
                        "${FirebaseAuth.instance.currentUser!.photoURL}"),
                  ),
                ),
                const Spacer(),
                Text(
                  "${FirebaseAuth.instance.currentUser!.displayName}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                  ),
                ),
                const Spacer(),
                Text(
                  "${FirebaseAuth.instance.currentUser!.email}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: size.height * 0.02,
                  ),
                ),
                const Spacer(),
                ElevatedButton(
                    onPressed: () async {
                      await FirebaseServices().googleSignout();
                      // ignore: use_build_context_synchronously
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()));
                    },
                    child: Row(
                      children: const [
                        Text("Signout"),
                        Spacer(),
                        Icon(Icons.send),
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
