import 'package:ashes/common/bottomNavBar.dart';
import 'package:flutter/material.dart';
import 'package:ashes/services/db_services.dart';

class ArticleListScreen extends StatefulWidget {
  const ArticleListScreen({super.key, required title, required body});

  @override
  State<ArticleListScreen> createState() => _ArticleListScreenState();
}

class _ArticleListScreenState extends State<ArticleListScreen> {
  List<Map<String, dynamic>> articles = [];
  @override
  void initState() {
    super.initState();
    loadArticles();
  }

  Future<void> loadArticles() async {
    List<Map<String, dynamic>> fetchedArticles =
    await ArticleService.getArticles();
    setState(() {
      articles = fetchedArticles;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body:ListView.builder(itemBuilder: (context, index) {
        final article = articles[index];
        return  Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              AspectRatio(
                aspectRatio: 16 / 9, // Adjust aspect ratio as needed
                child: Image.network(
                  article['ThumbNail'],
                  fit: BoxFit.fitHeight,
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                article['Title'],
                style: const TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 22,
                  fontFamily: 'malayalam',
                ),
              ),
              SizedBox(
                height: screenHeight * 0.02,
              ),
              Text(
                article['Body'],
                style: const TextStyle(
                    fontSize: 18
                ),
              ),
            ],
          ),
        );
      },
        itemCount: articles.length,

      ),
      bottomNavigationBar: const ResponsiveBottomNavBar(),
    );
  }
}

