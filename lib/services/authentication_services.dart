// import 'package:firebase_auth/firebase_auth.dart';

// class AuthenticationService {
//   final FirebaseAuth _firebaseAuth;

//   AuthenticationService(this._firebaseAuth);

//   Stream<User?> get authStateChanges => _firebaseAuth.idTokenChanges();
// }

// Future<String?> signup(
//     {required String email, required String password}) async {
//   try {
//     await _firebaseAuth.createUserwithEmailAndPassword(
//         email: email, password: password);
//     return "Signed up";
//   } on FirebaseAuthException catch (e) {
//     if (e.code == "weak-password") {
//       print(e.message);
//       return e.message;
//     } else if (e.code == "email-already-in-use") {
//       print(e.message);
//       return e.message;
//     } else {
//       print(e.message);
//       return e.message;
//     }
//   }
// }

// Future<String?> signIn(
// {required String email, required String password}) async {
// try {
// await _firebaseAuth. signInwithemailAndPassword(
// email: email, password: password);
// return "Signed in";
// } on FirebaseAuthException catch (e) {
// print (e.message) ;
// return e.message;
// }
// }

// Future<void> signOut() async{
// await _firebaseAuth.signOut();

// }
 



