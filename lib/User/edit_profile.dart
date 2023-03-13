// import 'dart:io';
// import 'package:alqgp/models/user_model.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import "package:flutter/material.dart";
// import 'package:image_picker/image_picker.dart';
// import 'package:alqgp/widgets/show_dialog.dart';

// class EditProfile extends StatefulWidget {
//   final UserModel? currentUser;
//   Function? onLoad;
//   EditProfile({this.currentUser, this.onLoad});

//   @override
//   _EditProfileState createState() => _EditProfileState();
// }

// class _EditProfileState extends State<EditProfile> {
//   final _scaffoldKey = GlobalKey<ScaffoldState>();
//   TextEditingController firstNameController = TextEditingController();
//   TextEditingController secondNameController = TextEditingController();
//   TextEditingController emailController = TextEditingController();
//   bool isLoading = false;
//   bool _displayNameValid = true;
//   bool _bioValid = true;
//   String? userImage;

//   @override
//   void initState() {
//     super.initState();
//     firstNameController.text = widget.currentUser!.firstName.toString();
//     secondNameController.text = widget.currentUser!.secondName.toString();
//     emailController.text = widget.currentUser!.email.toString();
//     userImage = widget.currentUser!.image.toString();
//   }

//   final _auth = FirebaseAuth.instance;
//   late User siginUser;
//   File? imageFile;
//   bool _isloading = false;

//   Column buildDisplayNameField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         const Padding(
//             padding: EdgeInsets.only(top: 12.0),
//             child: Text(
//               "First name",
//               style: TextStyle(color: Colors.grey),
//             )),
//         TextField(
//           controller: firstNameController,
//           decoration: InputDecoration(
//             hintText: "Enter your first name",
//             errorText: _displayNameValid
//                 ? null
//                 : "First name should be at least 3 characters",
//           ),
//         )
//       ],
//     );
//   }

//   Column buildBioField() {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: <Widget>[
//         const Padding(
//           padding: EdgeInsets.only(top: 12.0),
//           child: Text(
//             "Last name",
//             style: TextStyle(color: Colors.grey),
//           ),
//         ),
//         TextField(
//           controller: secondNameController,
//           decoration: InputDecoration(
//             hintText: "Enter your last name",
//             errorText: _bioValid ? null : "Last name can't be empty",
//           ),
//         )
//       ],
//     );
//   }

//   updateProfileData() async {
//     try {
//       setState(() {
//         _isloading = true;
//       });
//       firstNameController.text.trim().length < 3 ||
//               firstNameController.text.isEmpty
//           ? _displayNameValid = false
//           : _displayNameValid = true;
//       secondNameController.text.trim().length < 1
//           ? _bioValid = false
//           : _bioValid = true;

//       if (_displayNameValid && _bioValid) {
//         await FirebaseFirestore.instance
//             .collection("student")
//             .doc(widget.currentUser!.uid)
//             .update({
//           "firstName": firstNameController.text,
//           "secondName": secondNameController.text,
//         });
//       }
//       if (imageFile != null) {
//         updateUserImage();
//       }
//       if (userImage == null) {
//         deleteUserImage();
//       }
//       widget.onLoad!();
//       setState(() {
//         _isloading = false;
//       });
//       showAlertDialog(context, 'Your profile updated successfully', true);
//     } catch (e) {
//       print(e);
//       setState(() {
//         _isloading = false;
//       });
//     }
//   }

//   Future updateUserImage() async {
//     try {
//       siginUser = _auth.currentUser!;
//       final uId = siginUser.uid;
//       final ref = FirebaseStorage.instance
//           .ref()
//           .child('usersImages')
//           .child("${uId}jpg");
//       ref.putFile(imageFile!).then((p0) async {
//         String url = await ref.getDownloadURL();
//         await FirebaseFirestore.instance.collection("student").doc(uId).update({
//           "image": url,
//         }).then((value) => (value) {
//               getUserProfile();
//               return value;
//             });
//       });
//     } catch (error) {
//       print(error);
//     }
//   }

//   Future deleteUserImage() async {
//     try {
//       siginUser = _auth.currentUser!;
//       final uId = siginUser.uid;
//       final ref = FirebaseStorage.instance
//           .ref()
//           .child('usersImages')
//           .child("${uId}jpg");
//       await ref.delete().then((p0) async {
//         await FirebaseFirestore.instance.collection("student").doc(uId).update({
//           "image": '',
//         }).then((value) => (value) {
//               getUserProfile();
//               return value;
//             });
//       });
//     } catch (error) {
//       print(error);
//     }
//   }

//   //--------------uploade image from gallery------------------------------------
//   void pickImageGallery() async {
//     try {
//       PickedFile? pickedFile = await ImagePicker().getImage(
//           source: ImageSource.gallery, maxWidth: 1000, maxHeight: 1000);
//       imageFile = File(pickedFile!.path);
//     } catch (e) {
//       print(e.toString() + '');
//     }
//   }

//   //--------------uploade images------------------------------------
//   uploadImage(context) {
//     showDialog(
//         context: context,
//         builder: (con) {
//           return AlertDialog(
//             title: Text(
//               "Upload image",
//               style: TextStyle(color: Color.fromARGB(255, 62, 3, 180)),
//             ),
//             content: Column(mainAxisSize: MainAxisSize.min, children: [
//               InkWell(
//                 onTap: () {
//                   pickImageGallery();
//                   Navigator.pop(con);
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Row(
//                     children: const [
//                       Icon(
//                         Icons.image,
//                         color: Color.fromARGB(255, 86, 3, 252),
//                       ),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Text(
//                         "Choose from library",
//                         style: TextStyle(color: Color(0xFF8649FC)),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//               InkWell(
//                 onTap: () {
//                   setState(() {
//                     userImage = null;
//                     Navigator.pop(con);
//                     print(userImage);
//                   });
//                 },
//                 child: Padding(
//                   padding: const EdgeInsets.all(5.0),
//                   child: Row(
//                     children: const [
//                       Icon(
//                         Icons.delete,
//                         color: Colors.redAccent,
//                       ),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Text(
//                         "Delete current Image",
//                         style: TextStyle(color: Colors.redAccent),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ]),
//           );
//         });
//   }

//   getUserProfile() {
//     print(_auth.currentUser!.uid);
//     return FirebaseFirestore.instance
//         .collection("student")
//         .doc(_auth.currentUser!.uid)
//         .snapshots();
//   }

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       key: _scaffoldKey,
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "Edit Profile",
//           style: TextStyle(
//             color: Colors.black,
//           ),
//         ),
//         leading: IconButton(
//           onPressed: () => Navigator.pop(context),
//           icon: const Icon(
//             Icons.arrow_back,
//             size: 30.0,
//             color: Colors.black,
//           ),
//         ),
//       ),
//       body: _isloading
//           ? Container(
//               height: size.height,
//               width: size.width,
//               child: Center(
//                 child: SizedBox(
//                   width: 50,
//                   height: 50,
//                   child: CircularProgressIndicator(
//                     color: Colors.redAccent.withOpacity(.4),
//                   ),
//                 ),
//               ),
//             )
//           : StreamBuilder<DocumentSnapshot>(
//               stream: getUserProfile(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return ListView(
//                     children: <Widget>[
//                       Column(
//                         children: <Widget>[
//                           const SizedBox(
//                             height: 40,
//                           ),
//                           Container(
//                             margin: const EdgeInsets.only(
//                                 bottom: 5, left: 26, right: 26),
//                             alignment: Alignment.center,
//                             height: 130,
//                             width: 200,
//                             child: Stack(
//                               children: [
//                                 Padding(
//                                   padding: EdgeInsets.only(
//                                     top: 16.0,
//                                     bottom: 8.0,
//                                   ),
//                                   child: (userImage != null && userImage != '')
//                                       ? CircleAvatar(
//                                           radius: 50,
//                                           backgroundImage: NetworkImage(
//                                             userImage!,
//                                           ),
//                                           backgroundColor: Colors.white,
//                                         )
//                                       : (snapshot.data!
//                                               .data()
//                                               .toString()
//                                               .contains('image'))
//                                           ? (snapshot.data!['image'] != '' &&
//                                                   snapshot.data!['image']
//                                                       .toString()
//                                                       .contains('usersImages'))
//                                               ? CircleAvatar(
//                                                   radius: 50,
//                                                   backgroundImage: NetworkImage(
//                                                     '${snapshot.data!['image']}',
//                                                   ),
//                                                   backgroundColor: Colors.white,
//                                                 )
//                                               : const CircleAvatar(
//                                                   radius: 50,
//                                                   backgroundImage: AssetImage(
//                                                     'images/5b8f3d9f30460aeedbe6a235e2d001d3.jpg',
//                                                   ),
//                                                   backgroundColor: Colors.white,
//                                                 )
//                                           : const CircleAvatar(
//                                               radius: 50,
//                                               backgroundImage: AssetImage(
//                                                 'images/5b8f3d9f30460aeedbe6a235e2d001d3.jpg',
//                                               ),
//                                               backgroundColor: Colors.white,
//                                             ),
//                                 ),
//                                 Positioned(
//                                   top: 0,
//                                   left: 0,
//                                   child: InkWell(
//                                     onTap: () {
//                                       uploadImage(context);
//                                     },
//                                     child: Container(
//                                       padding: const EdgeInsets.all(5),
//                                       decoration: const BoxDecoration(
//                                         shape: BoxShape.circle,
//                                         color: Colors.redAccent,
//                                       ),
//                                       child: const Icon(
//                                         Icons.edit,
//                                         color: Colors.white,
//                                         size: 20,
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Text(snapshot.data!['email']),
//                           Padding(
//                             padding: EdgeInsets.all(16.0),
//                             child: Column(
//                               children: <Widget>[
//                                 buildDisplayNameField(),
//                                 buildBioField(),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             height: 20,
//                           ),
//                           InkWell(
//                             onTap: updateProfileData,
//                             child: Container(
//                               padding:
//                                   const EdgeInsets.symmetric(horizontal: 20),
//                               margin: EdgeInsets.symmetric(
//                                   horizontal: size.width * .2),
//                               height: 45,
//                               decoration: BoxDecoration(
//                                 color: Theme.of(context).primaryColor,
//                                 borderRadius: BorderRadius.circular(40),
//                               ),
//                               child: const Center(
//                                 child: Text(
//                                   "Update Profile",
//                                   style: TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20.0,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   );
//                 } else {
//                   return Container(
//                     height: size.height,
//                     width: size.width,
//                     child: Center(
//                       child: SizedBox(
//                         width: 50,
//                         height: 50,
//                         child: CircularProgressIndicator(
//                           color: Colors.redAccent.withOpacity(.4),
//                         ),
//                       ),
//                     ),
//                   );
//                 }
//               }),
//     );
//   }
// }
