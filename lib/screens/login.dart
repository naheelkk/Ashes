import 'package:ashes/screens/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ashes/auth_services/auth_service.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final AuthService _authService = AuthService();
  User? _user;

  @override
  void initState() {
    super.initState();
    _authService.authStateChanges.listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _user != null
          ? const HomePage()
          : Center(
        child: Container(
          margin: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    vertical: MediaQuery.of(context).size.height * 0.1),
                child: Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Image.asset(
                    'images/Logo.png',
                    height: 100,
                    width: 100,
                    color: Colors.white,
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  _authService.signInWithGoogle();
                },
                child: SizedBox(
                  width: MediaQuery.of(context).size.width * 0.7,
                  child: Card(
                    child: ListTile(
                      leading: SvgPicture.asset('images/google.svg'),
                      title: const Text('Login with Google'),
                    ),
                  ),
                ),
              ),
               // SizedBox(height: MediaQuery.of(context).size.height * 0.02), // Added SizedBox for spacing
              // GestureDetector(
              //   onTap: () {
              //     _authService.signInWithTwitter();
              //   },
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.7,
              //     child: Card(
              //       child: ListTile(
              //         leading: SvgPicture.asset('images/x.svg'),
              //         title: const Text('Login with X'),
              //       ),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
