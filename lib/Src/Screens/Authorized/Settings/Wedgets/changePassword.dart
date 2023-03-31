import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/image_paths.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/Widgets/Form/form_header_widget.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
import 'package:alqgp/Src/controllers/changePass_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ChangePasswordController());
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              backButton(),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: tDefaultSize),
                child: Column(
                  children: [
                    const SizedBox(height: tDefaultSpacing),
                    const FormHeaderWidget(
                      image: tResetPass,
                      title: tChangePassword,
                      subTitle: tChangePassSup,
                      heightBetween: 15.0,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: tFormHeight),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.email,
                            decoration: const InputDecoration(
                                label: Text(tEmail),
                                prefixIcon: Icon(Icons.email_outlined)),
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
                          const SizedBox(height: tFormHeight - 10),
                          Obx(
                            () => TextFormField(
                              controller: controller.pass,
                              decoration: InputDecoration(
                                label: Text(tPassword),
                                prefixIcon: Icon(Icons.fingerprint),
                                suffixIcon: IconButton(
                                  onPressed: (() {
                                    controller.changeShow1();
                                  }),
                                  icon: controller.notshowpass1.value
                                      ? Icon(Icons.remove_red_eye_sharp)
                                      : Icon(Icons.remove_red_eye_outlined),
                                ),
                              ),
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("Please enter your password ");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Please enter a valid Password (Min. 6 Character)");
                                }
                              },
                              obscureText: controller.notshowpass1.value,
                            ),
                          ),
                          const SizedBox(height: tFormHeight - 10),
                          Obx(
                            () => TextFormField(
                              controller: controller.newPass,
                              decoration: InputDecoration(
                                label: Text("New Password"),
                                prefixIcon: Icon(Icons.fingerprint),
                                suffixIcon: IconButton(
                                  onPressed: (() {
                                    controller.changeShow2();
                                  }),
                                  icon: controller.notshowpass2.value
                                      ? Icon(Icons.remove_red_eye_sharp)
                                      : Icon(Icons.remove_red_eye_outlined),
                                ),
                              ),
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("Please enter your password ");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Please enter a valid Password (Min. 6 Character)");
                                }
                              },
                              obscureText: controller.notshowpass2.value,
                            ),
                          ),
                          const SizedBox(height: tFormHeight - 10),
                          Obx(
                            () => TextFormField(
                              controller: controller.reNewPass,
                              decoration: InputDecoration(
                                label: Text("Renter New Password"),
                                prefixIcon: Icon(Icons.fingerprint),
                                suffixIcon: IconButton(
                                  onPressed: (() {
                                    controller.changeShow3();
                                  }),
                                  icon: controller.notshowpass3.value
                                      ? Icon(Icons.remove_red_eye_sharp)
                                      : Icon(Icons.remove_red_eye_outlined),
                                ),
                              ),
                              validator: (value) {
                                RegExp regex = new RegExp(r'^.{6,}$');
                                if (value!.isEmpty) {
                                  return ("Please enter your password ");
                                }
                                if (!regex.hasMatch(value)) {
                                  return ("Please enter a valid Password (Min. 6 Character)");
                                }
                              },
                              obscureText: controller.notshowpass3.value,
                            ),
                          ),
                          // const SizedBox(height: tFormHeight - 10),
                          const SizedBox(height: tDefaultPadding),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (controller.newPass.text ==
                                      controller.reNewPass.text) {
                                    controller.changetPass();
                                    controller.email.clear();
                                    controller.pass.clear();
                                    controller.newPass.clear();
                                    controller.reNewPass.clear();
                                  } else {
                                    Get.snackbar(
                                        "error", "Passwoerd Doen't match",
                                        snackPosition: SnackPosition.BOTTOM,
                                        backgroundColor:
                                            Colors.red.withOpacity(0.33),
                                        colorText: Colors.red);
                                  }
                                }
                              },
                              child: const Text(tNext),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
