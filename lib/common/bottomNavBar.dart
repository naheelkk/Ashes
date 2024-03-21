  import 'package:ashes/screens/fixtures.dart';
  import 'package:ashes/screens/gallery.dart';
  import 'package:ashes/screens/news_screen.dart';
  import 'package:flutter/material.dart';
  import 'package:ashes/screens/home_page.dart'; // Import your HomePage screen

  class ResponsiveBottomNavBar extends StatefulWidget {
    const ResponsiveBottomNavBar({Key? key}) : super(key: key);

    @override
    State<ResponsiveBottomNavBar> createState() => _ResponsiveBottomNavBarState();
  }

  class _ResponsiveBottomNavBarState extends State<ResponsiveBottomNavBar> {
    int _selectedIndex = 0 ;

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
        unselectedItemColor: Colors.grey.shade500,
        fixedColor: Colors.grey.shade500,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: "Articles",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_sharp),
            label: "Gallery",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_cricket_outlined),
            label: "Fixtures",
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
      );
    }

    Widget buildNarrowLayout() {
      return BottomNavigationBar(
        unselectedItemColor: Colors.grey.shade500,
        fixedColor: Colors.grey.shade500,
        showUnselectedLabels: true,
        items: const[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_max),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.article_outlined),
            label: "Articles",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_collection_sharp),
            label: "Gallery",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sports_cricket_outlined),
            label: "Fixtures",
          ),
        ],
        type: BottomNavigationBarType.shifting,
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
      );
    }

    void _onItemTapped(BuildContext context, int index) {
      setState(() {
        _selectedIndex = 2;
      });
      switch (index) {
        case 0:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const HomePage()),
          );
          break;
        case 1:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const NewsScreen()),
          );
          break;
        case 2:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const GalleryPage()),
          );
          break;
        case 3:
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FixturesPage()),
          );

          break;
        default:
          break;
      }
    }
  }
