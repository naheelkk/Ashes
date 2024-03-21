import 'package:flutter/material.dart';
import 'package:ashes/common/bottomNavBar.dart';
import 'package:ashes/services/db_services.dart';

class GalleryPage extends StatefulWidget {
  const GalleryPage({Key? key}) : super(key: key);

  @override
  State<GalleryPage> createState() => _GalleryPageState();
}

class _GalleryPageState extends State<GalleryPage> {
  @override
  void initState() {
    super.initState();
    loadImages();
  }

  List<Map<dynamic, dynamic>> images = [];

  Future<void> loadImages() async {
    List<Map<dynamic, dynamic>> fetchedImages = await GalleryService.getPhotos();
    setState(() {
      images = fetchedImages;
    });
  }

  int _crossAxisCount(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    if (screenWidth > 600) {
      return 3; // Adjusted cross axis count for larger screens
    } else if (screenWidth > 400) {
      return 2; // Adjusted cross axis count for medium-sized screens
    } else {
      return 1; // Default cross axis count for smaller screens
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: images.isEmpty
          ? Center(
        child: CircularProgressIndicator(
          backgroundColor: Colors.white,
          color: Colors.grey.shade800,
        ),
      )
          : SingleChildScrollView(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            return GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: images.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _crossAxisCount(context),
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemBuilder: (context, index) {
                final imageData = images[index];
                return GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          child: Container(
                            padding: const EdgeInsets.all(16.0),
                            child: Image.network(imageData['Image']),
                          ),
                        );
                      },
                    );
                  },
                  child: Card(
                    elevation: 3,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                              top: Radius.circular(10),
                            ),
                            child: Image.network(
                              imageData['Image'],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            imageData['SubTitle'] ?? '',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      bottomNavigationBar: const ResponsiveBottomNavBar(),
    );
  }
}
