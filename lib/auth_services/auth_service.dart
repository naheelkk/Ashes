import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Stream<User?> get authStateChanges => _auth.authStateChanges();

  Future<UserCredential?> signInWithGoogle() async {
    try {
      final GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      return await _auth.signInWithProvider(googleAuthProvider);
    } catch (e) {
      rethrow;
    }
  }
  // Future<UserCredential?> signInWithTwitter() async{
  //   try{
  //     final TwitterAuthProvider twitterAuthProvider = TwitterAuthProvider();
  //     return await _auth.signInWithProvider(twitterAuthProvider);
  //   }
 //     print('error logging in');
  //     rethrow;
  //   }
  //   return null;
  // }
}