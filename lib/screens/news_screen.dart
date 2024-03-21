import 'package:ashes/services/db_services.dart';
import 'package:flutter/material.dart';
import 'package:ashes/common/bottomNavBar.dart';
import 'package:ashes/screens/articleListScreen.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({Key? key}) : super(key: key);

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  List<Map<String, dynamic>> articles = [];

  @override
  void initState() {
    super.initState();
    loadArticles();
  }

  Future<void> loadArticles() async {
    List<Map<String, dynamic>> fetchedArticles = await ArticleService.getArticles();
    setState(() {
      articles = fetchedArticles;
    });
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: articles.isEmpty
          ? Center(
        child: LinearProgressIndicator(
          color: Colors.grey.shade800,
          backgroundColor: Colors.white,
        ),
      )
          : ListView.builder(
        itemCount: articles.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> article = articles[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ArticleListScreen(
                    title: article['title'],
                    body: article['body'],
                  ),
                ),
              );
            },
            child: Container(
              height: screenHeight * 0.13,
              padding: const EdgeInsets.all(12.0),
              color: Colors.grey.shade900,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 3,
                    child: Image.network(
                      article['ThumbNail'],
                      fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          article['Title'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        const SizedBox(height: 3),
                        Text(
                          article['Subtitle'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
      bottomNavigationBar: const ResponsiveBottomNavBar(),
    );
  }
}