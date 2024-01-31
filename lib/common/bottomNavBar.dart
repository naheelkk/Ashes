import 'package:flutter/material.dart';

class ResponsiveBottomNavBar extends StatefulWidget {
  ResponsiveBottomNavBar({super.key});
  @override
  State<ResponsiveBottomNavBar> createState() => _ResponsiveBottomNavBarState();
}

class _ResponsiveBottomNavBarState extends State<ResponsiveBottomNavBar> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth > 600) {
          // Wide screen layout
          return buildWideLayout();
        } else {
          // Narrow screen layout
          return buildNarrowLayout();
        }
      },
    );
  }

  Widget buildWideLayout() {
    return BottomNavigationBar(
      unselectedItemColor: Colors.blue,
      selectedItemColor: Colors.amber,
      showUnselectedLabels: true,
      items: [
        BottomNavigationBarItem(
          activeIcon: Icon(Icons.home_max),
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper_rounded),
          label: "News",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.photo_library), label: "Gallery"),
        BottomNavigationBarItem(
            icon: Icon(Icons.schedule_rounded), label: "Fixtures"),
      ],
      type: BottomNavigationBarType.shifting,
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() {
        _selectedIndex = index;
      }),
    );
  }

  Widget buildNarrowLayout() {
    return BottomNavigationBar(
      unselectedItemColor: Colors.blue,
      selectedItemColor: Colors.amber,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: "Home",
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.newspaper_rounded),
          label: "News",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.photo_library), label: "Gallery"),
        BottomNavigationBarItem(
            icon: Icon(Icons.schedule_rounded), label: "Fixtures"),
      ],
      type: BottomNavigationBarType.fixed,
      currentIndex: _selectedIndex,
      onTap: (index) => setState(() {
        _selectedIndex = index;
      }),
    );
  }
}
