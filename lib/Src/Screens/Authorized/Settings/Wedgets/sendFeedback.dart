import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Widgets/Form/form_header_widget.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
import 'package:alqgp/Src/controllers/settengs_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SendFeedback extends StatelessWidget {
  const SendFeedback({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SettengsController());
    final formKey = GlobalKey<FormState>();
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              backButton(),
              Container(
                padding: const EdgeInsets.all(tDefaultScreenPadding),
                margin: const EdgeInsets.only(top: tDefaultSpacing * 1.5),
                child: Column(
                  children: [
                    const FormHeaderWidget(
                      image: "images/feedback.png",
                      title: "appreciate all feedback",
                      subTitle:
                          'Please know that the feedback will be sent annonmosly.',
                      heightBetween: 15.0,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: tFormHeight),
                    Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.title,
                            decoration: const InputDecoration(
                                label: Text("Title"),
                                prefixIcon: Icon(Icons.short_text_sharp)),
                            validator: (value) {
                              RegExp regex = new RegExp(r'^[a-z A-Z,.\-]+$');
                              if (value!.isEmpty) {
                                return ("Please Enter a Title");
                              }
                              // reg expression for email validation
                              if (!regex.hasMatch(value)) {
                                return ("Enter a valid Title");
                              }
                              return null;
                            },
                          ),
                          const SizedBox(height: tFormHeight - 10),
                          TextFormField(
                            controller: controller.problem,
                            decoration: const InputDecoration(
                                label: Text("Your Feedback"),
                                prefixIcon:
                                    Icon(Icons.thumbs_up_down_outlined)),
                            validator: (value) {
                              if (value!.isEmpty) {
                                return ("Please Enter Your Feedback");
                              }

                              return null;
                            },
                          ),
                          const SizedBox(height: tDefaultPadding),
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  controller.addFeedback();
                                  controller.title.clear();
                                  controller.problem.clear();
                                }
                              },
                              child: const Text("Submet Report"),
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
