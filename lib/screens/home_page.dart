import 'package:ashes/auth_services/auth_service.dart';
import 'package:ashes/common/bottomNavBar.dart';
import 'package:ashes/screens/articleListScreen.dart';
import 'package:ashes/screens/playerList.dart';
import 'package:ashes/services/db_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthService _authService = AuthService();
  List<Map<String, dynamic>> _articles = [];
  User? _user;

  @override
  void initState() {
    super.initState();
    _authService.authStateChanges.listen((event) {
      setState(() {
        _user = event;
      });
    });
    _loadArticles();
  }

  Future<void> _loadArticles() async {
    List<Map<String, dynamic>> fetchedArticles =
    await ArticleService.getArticles();
    setState(() {
      _articles = fetchedArticles;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: ListTile(
            leading: Image.asset(
              'images/Logo.png',
              color: Colors.white,
              height: screenHeight * .5,
              width: screenWidth * .2,
            ),
            trailing: _user != null
                ? GestureDetector(
                onTap: () => _auth.signOut(), child: const Text('Sign out'))
                : null,
          ),
        ),
        body: _articles.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : Column(
          children: [
            SizedBox(
              height: screenHeight * 0.03,
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ArticleListScreen(
                      title: _articles.first['title'],
                      body: _articles.first['body'],
                    ),
                  ),
                );
              },
              child: Container(
                height: screenHeight * 0.5,
                width: screenWidth * 0.9,
                decoration: BoxDecoration(
                  color: Colors.grey.shade600,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Stack(
                  children: [
                    Image.network(
                      _articles.last['ThumbNail'],
                      height: screenHeight * 0.5,
                      width: screenWidth * 0.9,
                      fit: BoxFit.cover,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Image(
                          image: AssetImage('images/iconNew.png'),
                          color: Colors.white,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          _articles.last['Title'],
                          style: const TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                            fontSize: 30,
                            fontFamily: 'malayalam',
                            letterSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: SizedBox(
                height: 200,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const PlayerList(),
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: screenWidth * 0.4,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade800,
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage('images/aju.jpg'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.bottomCenter,
                              child: Opacity(
                                opacity: .5,
                                child: Text(
                                  'Meet The Guys',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      );
                    } else {
                      final articleIndex = index - 1;
                      if (articleIndex < _articles.length) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ArticleListScreen(
                                  title: _articles[articleIndex]['title'],
                                  body: _articles[articleIndex]['body'],
                                ),
                              ),
                            );
                          },
                          child: Container(
                            width: screenWidth * 0.4,
                            decoration: BoxDecoration(
                              color: Colors.grey.shade800,
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(
                                    _articles[articleIndex]['ThumbNail']),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Text(
                                _articles[articleIndex]['Title'],
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    }
                  },
                  separatorBuilder: (context, index) {
                    return SizedBox(
                      width: screenWidth * 0.05,
                    );
                  },
                  itemCount: 4,
                ),
              ),
            ),
          ],
        ),
        bottomNavigationBar: const ResponsiveBottomNavBar(),
      ),
    );
  }
}