import 'package:alqgp/Src/Models/user_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class achievements extends StatelessWidget {
  const achievements({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(title: Text("All achievements"), centerTitle: true),
      body: Padding(
        padding: const EdgeInsets.all(tDefaultPadding),
        child: Column(
          children: [
            const SizedBox(height: tDefaultPadding),

            // ******** getx bulder for stream + the achivements
            FutureBuilder(
              future: controller.getAllUsers(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<UserModel> userData = snapshot.data as List<UserModel>;
                    return Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 12);
                          },
                          physics: const BouncingScrollPhysics(),
                          itemCount: userData.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: const EdgeInsets.all(tDefaultPadding),
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(tCardRadius),
                                color: tPrimaryColor,
                              ),
                              height: 150,
                              width: size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Image(
                                      image: AssetImage("images/star.png"),
                                      height: 110),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("perfect",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyLarge),
                                      const SizedBox(height: 10),
                                      Text("Circulatory system",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium),
                                    ],
                                  ),
                                  const SizedBox(width: 5),
                                  Text("4/10",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge),
                                ],
                              ),
                            );
                          }),
                    );
                  } else if (snapshot.hasError) {
                    return Center(child: Text(snapshot.error.toString()));
                  } else {
                    return const Center(child: Text('Somthing went wrong.'));
                  }
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
