import 'dart:io';

import 'package:alqgp/Src/Models/user_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/image_paths.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
import 'package:alqgp/Src/controllers/profile_controller.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class updateProfile extends StatelessWidget {
  final String photo;
  updateProfile({super.key, required this.photo});

  // String imageUrl = '';

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              backButton(),
              Container(
                margin: const EdgeInsets.only(top: tDefaultSpacing),
                padding: const EdgeInsets.all(tDefaultScreenPadding),
                child: FutureBuilder(
                  future: controller.getUserData(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        UserModel userData = snapshot.data as UserModel;

                        //Controllers
                        final email =
                            TextEditingController(text: userData.email);
                        final password = TextEditingController();
                        final fullName =
                            TextEditingController(text: userData.fullName);
                        final phoneNo =
                            TextEditingController(text: userData.phoneNo);

                        return Column(
                          children: [
                            GestureDetector(
                              // image & icon
                              child: Stack(
                                children: [
                                  SizedBox(
                                    width: 120,
                                    height: 120,
                                    child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        child: Obx(
                                          () => Image(
                                              image: NetworkImage(
                                                  controller.photo.value == ""
                                                      ? photo
                                                      : controller
                                                          .photo.value)),
                                        )),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: Container(
                                      width: 35,
                                      height: 35,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                        color: tPrimaryColor,
                                      ),
                                      child: const Icon(Icons.camera_enhance,
                                          size: 20.0, color: Colors.black),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () async {
                                // picking the image
                                ImagePicker imagepicker = ImagePicker();
                                XFile? file = await imagepicker.pickImage(
                                    source: ImageSource.gallery);

                                // check if there's an image
                                if (file == null) {
                                  Get.snackbar("error", "Please pick a picture",
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor:
                                          Colors.red.withOpacity(0.3),
                                      colorText: Colors.red);
                                } else {
                                  //give the image a name using the current time in miliseconds
                                  String uniqueFileName = DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString();

                                  //Get a reference to storage root
                                  Reference referenceRoot =
                                      FirebaseStorage.instance.ref();
                                  Reference referenceDirImages =
                                      referenceRoot.child('images');
                                  //Create a reference for the image to be stored
                                  Reference referenceImageToUpload =
                                      referenceDirImages.child(uniqueFileName);

                                  try {
                                    //Store the file
                                    await referenceImageToUpload
                                        .putFile(File(file.path));
                                    //Success: get the download URL
                                    controller.photo.value =
                                        await referenceImageToUpload
                                            .getDownloadURL();
                                  } catch (error) {
                                    Get.snackbar("error", "$error",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor:
                                            Colors.red.withOpacity(0.3),
                                        colorText: Colors.red);
                                  }
                                }
                              },
                            ),
                            const SizedBox(height: 30), // delete from here
                            const Divider(), // & replase it with const SizedBox(height: 50),
                            const SizedBox(height: 10), //to here

                            // update form
                            Form(
                              key: formKey,
                              child: Column(
                                children: [
                                  TextFormField(
                                    validator: (value) {
                                      RegExp regex =
                                          new RegExp(r'^[a-z A-Z,.\-]+$');
                                      if (value!.isEmpty) {
                                        return ("Name cannot be Empty");
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return ("Enter a valid name");
                                      }
                                      return null;
                                    },
                                    controller: fullName,
                                    decoration: const InputDecoration(
                                        label: Text(tFullName),
                                        prefixIcon:
                                            Icon(Icons.person_outline_rounded)),
                                  ),
                                  const SizedBox(height: tFormHeight),
                                  TextFormField(
                                    controller: email,
                                    decoration: InputDecoration(
                                      enabled: false, //disabel this field input
                                      filled: true,
                                      fillColor: Colors.grey.withOpacity(0.33),
                                      label: Text(tEmail),
                                      prefixIcon: Icon(Icons.email_outlined),
                                    ),
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return ("Please Enter Your Email");
                                      }
                                      // reg expression for email validation
                                      if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                        return ("Please Enter a valid email");
                                      }
                                      return null;
                                    },
                                  ),
                                  const SizedBox(height: tFormHeight),
                                  TextFormField(
                                    validator: (value) {
                                      RegExp regex =
                                          new RegExp(r'^(?:[+0]9)[0-9]{10,}$');
                                      if (value!.isEmpty) {
                                        return ("Please enter your phone number ");
                                      }
                                      if (!regex.hasMatch(value)) {
                                        return ("Please enter a valid phone number (+966 000000000)");
                                      }
                                    },
                                    controller: phoneNo,
                                    decoration: const InputDecoration(
                                        label: Text(tPhoneNo),
                                        prefixIcon: Icon(Icons.phone)),
                                  ),
                                  // const SizedBox(height: tFormHeight - 20),
                                  // Obx(
                                  //   () => TextFormField(
                                  //     validator: (value) {
                                  //       RegExp regex = new RegExp(r'^.{6,}$');
                                  //       if (value!.isEmpty) {
                                  //         return ("Please enter your password ");
                                  //       }
                                  //       if (!regex.hasMatch(value)) {
                                  //         return ("Please enter a valid Password (Min. 6 Character)");
                                  //       }
                                  //     },
                                  //     obscureText: controller.notshowpass.value,
                                  //     controller: password,
                                  //     decoration: InputDecoration(
                                  //       label: Text(tPassword),
                                  //       prefixIcon: Icon(Icons.fingerprint),
                                  //       suffixIcon: IconButton(
                                  //         onPressed: (() {
                                  //           controller.changeShow();
                                  //         }),
                                  //         icon: controller.notshowpass.value
                                  //             ? Icon(Icons.remove_red_eye_sharp)
                                  //             : Icon(Icons
                                  //                 .remove_red_eye_outlined),
                                  //       ),
                                  //     ),
                                  //   ),
                                  // ),
                                  const SizedBox(height: tDefaultSpacing * 1.5),

                                  // edit button
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                      onPressed: () async {
                                        if (formKey.currentState!.validate()) {
                                          final user = UserModel(
                                            email: email.text.trim(),
                                            fullName: fullName.text.trim(),
                                            phoneNo: phoneNo.text.trim(),
                                          );
                                          await controller.updateRecord(
                                            fullName.text.trim(),
                                            phoneNo.text.trim(),
                                            controller.photo.value,
                                          );
                                        }
                                      },
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor: tPrimaryColor,
                                          side: BorderSide.none,
                                          shape: const StadiumBorder()),
                                      child: const Text(tEditProfile,
                                          style: TextStyle(color: tDarkColor)),
                                    ),
                                  ),
                                  const SizedBox(height: tFormHeight),

                                  //..
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text.rich(
                                        TextSpan(
                                          text: "", //tJoined
                                          style: TextStyle(fontSize: 12),
                                          children: [
                                            TextSpan(
                                                text: "", //tJoinedAt
                                                style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 12))
                                          ],
                                        ),
                                      ),

                                      //delete button
                                      ElevatedButton(
                                        onPressed: () {
                                          controller.deleteUser();
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.redAccent
                                                .withOpacity(0.1),
                                            elevation: 0,
                                            foregroundColor: Colors.red,
                                            shape: const StadiumBorder(),
                                            side: BorderSide.none),
                                        child: const Text(tDelete),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      } else if (snapshot.hasError) {
                        return Center(child: Text(snapshot.error.toString()));
                      } else {
                        return const Center(
                            child: Text('Somthing went wrong.'));
                      }
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// pic files

/*final results = await FilePicker.platform.pickFiles( allowMultiple: false,

type: FileType.custom,
allowedExtensions: ['png', 'jpg'],);
if (results == null) {
Scaffold Messenger. of (context).showSnackBar(

const SnackBar(
content: Text('No file selected.'), ), // SnackBar
return null;);
}
final path = results.files.single.path!; final fileName = results.files.single.name;
print(path);
print (fileName);*/
