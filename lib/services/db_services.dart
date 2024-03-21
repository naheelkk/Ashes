import 'package:cloud_firestore/cloud_firestore.dart';

class ArticleService {
  static Future<List<Map<String, dynamic>>> getArticles() async {
    QuerySnapshot querySnapshot =
    await FirebaseFirestore.instance.collection('articles').get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    return documents.map((doc) => doc.data() as Map<String, dynamic>).toList();
  }
}

class GalleryService{
  static Future getPhotos()async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('images').get();
    List<QueryDocumentSnapshot> documents =  querySnapshot.docs;
    return documents.map((doc) => doc.data() as Map<dynamic,dynamic>).toList();
  }
}
class FixtureService{
  static Future getFixtures()async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('fixtures').get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    return documents.map((doc) => doc.data() as Map).toList();
  }
}
class PlayersService{
  static Future getPlayers()async{
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('players').get();
    List<QueryDocumentSnapshot> documents = querySnapshot.docs;
    return documents.map((doc) => doc.data() as Map).toList();

  }
}