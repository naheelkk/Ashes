import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:ashes/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: Scaffold(
          body: AnimatedSplashScreen(
              splash:Image.asset('images/Logo.png',scale: 1.0,),
              nextScreen: Login(),
            duration: 40,
            splashTransition: SplashTransition.scaleTransition,
            backgroundColor: Colors.blue.shade900,
          ),
      ),
    );
  }
}
