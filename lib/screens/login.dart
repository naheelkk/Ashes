import 'package:ashes/screens/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        margin: EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height * 0.1),
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
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Card(
                  child: ListTile(
                    leading: SvgPicture.asset('images/google.svg'),
                    title: Text('Continue with Google'),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>  HomePage()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
                child: Card(
                  child: ListTile(
                    leading: SvgPicture.asset('images/apple.svg'),
                    title: Text('Continue with Apple'),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomePage()));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7,
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
