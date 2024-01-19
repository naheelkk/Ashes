import 'package:ashes/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 170),
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Image.asset(
                  'images/Logo.png',
                  height: 100,
                  width: 100,
                  color: Colors.white,
                ),
              ),
            ),
            Container(
              child: Card(
                child: ListTile(
                  leading: SvgPicture.asset('images/google.svg'),
                  title: Text('Continue with Google'),
                ),
              ),
            ),
            Container(
              child: Card(
                child: ListTile(
                  leading: SvgPicture.asset('images/apple.svg'),
                  title: Text('Continue with Apple'),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(
                child: Card(
                  child: ListTile(
                    leading: SvgPicture.asset('images/guest.svg'),
                    title: Text('Continue as Guest'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
