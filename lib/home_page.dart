import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // primary: false,
        automaticallyImplyLeading: false,
        centerTitle: true,
        // leading: CircleAvatar(
        //   backgroundImage: AssetImage('images/Logo.svg',)
        // ),
        title: Image.asset(
        'images/Logo.png',
        color: Colors.white,
        height: 50,
        width: 50,

      ),
      ),
      body: Container(

      ),
    );
  }
}
