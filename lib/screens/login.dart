import 'package:flutter/material.dart';
import 'package:googleauth/firebaseServices.dart';
import 'package:googleauth/screens/profile.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _buttonPressed = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.25),
        child: Center(
          // child: Padding(
          //   padding: EdgeInsets.all(size.width * 0.3),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buttonPressed
                  ? const CircularProgressIndicator(
                      color: Colors.purple,
                      strokeWidth: 4,
                    )
                  : ElevatedButton(
                      onPressed: () async {
                        setState(() {
                          _buttonPressed = true;
                        });
                        await FirebaseServices().googleSignin();
                        // ignore: use_build_context_synchronously
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Profile()));
                      },
                      child: Row(
                        children: [
                          Image.asset(
                            'assets/googlelogo.png',
                            width: size.width * 0.07,
                            height: size.height * 0.07,
                          ),
                          // const Spacer(),
                          const Text("Signin with Google")
                        ],
                      ),
                    ),
            ],
          ),
          // ),
        ),
      ),
    );
  }
}
