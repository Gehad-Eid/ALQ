import 'package:alqgp/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

// 'student' collection reference
final CollectionReference studentCollection =
    FirebaseFirestore.instance.collection('student');

//get the user data for stream
Stream<UserModel?> getUserData(uid) => studentCollection
    .doc(uid)
    .snapshots()
    .map((snapshot) => UserModel.fromMap(snapshot.data()!));

// get the User
// Future getUser(uid) async {
//   final snapshot = await studentCollection.doc(uid).get();
//   if (snapshot.exists) {
//     return UserModel.fromMap(snapshot.data()!);
//   }
// }
