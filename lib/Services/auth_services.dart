import 'package:alqgp/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'database.dart';

// instance of Auth
final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

// get the logged in user
User? get currentUser => _firebaseAuth.currentUser;
User? user = FirebaseAuth.instance.currentUser;

// UserModel? _loggedInUser = UserModel();

// UserModel loggedin() {
//   studentCollection.doc(user!.uid).get().then((value) {
//     loggedInUser = UserModel.fromMap(value.data());
//   });
// }

Future<UserModel?> getUser() async {
  final snapshot = await studentCollection.doc(user!.uid).get();
  if (snapshot.exists) {
    return UserModel.fromMap(snapshot.data()!);
  }
}
