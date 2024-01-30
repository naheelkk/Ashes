import 'package:ashes/bottomNavBar.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Image.asset(
              'images/Logo.png',
              color: Colors.white,
              height: 50,
              width: 50,
            ),
            centerTitle: true,
            bottom: AppBar(
              title: Image.asset(
                'images/logoText.png',
                color: Colors.white,
                height: 100,
                width: 100,
              ),
              centerTitle: true,
            )),
        body: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Align(
              alignment: FractionalOffset.topCenter,
              child: Container(
                height: 400.0,
                width: 350,
                decoration: BoxDecoration(
                    color: Colors.grey.shade900,
                    borderRadius: BorderRadius.circular(25)),
                child: Column(
                  children: [
                    Text('Hello'),
                  ],
                ),
              ),
            ),
            ListView(

            ),
          ],
        ),
        bottomNavigationBar: ResponsiveBottomNavBar());
  }
}
