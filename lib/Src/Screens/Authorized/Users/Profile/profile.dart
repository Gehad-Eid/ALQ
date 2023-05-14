import 'package:alqgp/Src/Models/user_model.dart';
import 'package:alqgp/Src/Screens/Authorized/Settings/Settings.dart';
import 'package:alqgp/Src/Screens/Authorized/Settings/info.dart';
import 'package:alqgp/Src/Services/auth_repo.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/image_paths.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/controllers/home_controller.dart';
import 'package:alqgp/Src/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Widgets/menu_Widget.dart';
import '../userManagement.dart';
import 'updateProfile.dart';

class profile extends StatelessWidget {
  const profile({super.key});

  @override
  Widget build(BuildContext context) {
    // var isDark = MediaQuery.of(context).platformBrightness == Brightness.dark;
    final controller = Get.put(ProfileController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            // theme switch
            Positioned(
              right: tDefaultPadding,
              top: tDefaultSize,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(tCardRadius),
                  color: Colors.grey.shade300.withOpacity(0.33),
                ),
                height: 50,
                width: 50,
                child: Obx(
                  () => IconButton(
                      onPressed: () {
                        controller.changeTheme();
                      },
                      icon: Icon(!controller.isDark.value
                          ? Icons.nights_stay_sharp
                          : Icons.light_mode)),
                ),
              ),
            ),

            // Profile
            // FutureBuilder(
            //   future: controller.getUserData(),
            //   builder: (context, snapshot) {
            //     if (snapshot.connectionState == ConnectionState.done) {
            //       if (snapshot.hasData) {
            //         UserModel userData = snapshot.data as UserModel;

            GetX<HomeController>(
              init: Get.put<HomeController>(HomeController()),
              builder: (HomeController homeController) {
                if (homeController != null && homeController.theUser != null) {
                  // check if it's a bookmarks list for bookmarks screen or for add bookmark in lessons secreen

                  return Container(
                    padding: const EdgeInsets.all(tDefaultScreenPadding),
                    margin: const EdgeInsets.only(top: tDefaultSpacing * 1.33),
                    child: Column(
                      children: [
                        GestureDetector(
                          onTap: () => Get.to(() => updateProfile(
                              photo: homeController.theUser.photo!)),
                          child: Stack(
                            children: [
                              SizedBox(
                                width: 120,
                                height: 120,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: Image(
                                        image: NetworkImage(
                                            homeController.theUser.photo!))),
                              ),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: Container(
                                  width: 35,
                                  height: 35,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    color: tPrimaryColor,
                                  ),
                                  child: const Icon(Icons.mode_edit_outlined,
                                      size: 20.0, color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 10),
                        Text(homeController.theUser.fullName!,
                            style: Theme.of(context).textTheme.headline4),
                        Text(homeController.theUser.email!,
                            style: Theme.of(context).textTheme.bodyText2),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: 200,
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => updateProfile(
                                photo: homeController.theUser.photo!)),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: tPrimaryColor,
                                side: BorderSide.none,
                                shape: const StadiumBorder()),
                            child: const Text(tEditProfile,
                                style: TextStyle(color: tDarkColor)),
                          ),
                        ),
                        const SizedBox(height: 30),
                        const Divider(),
                        const SizedBox(height: 10),

                        ///MENU
                        MenuWidget(
                            title: "Settings",
                            icon: Icons.settings,
                            onPress: () {
                              Get.to(Settings());
                            }),

                        MenuWidget(
                            title: "User Management",
                            icon: Icons.supervisor_account,
                            onPress: () {
                              Get.to(UserManagement());
                            }),
                        const Divider(),
                        const SizedBox(height: 10),
                        MenuWidget(
                            title: "Information",
                            icon: Icons.info,
                            onPress: () {
                              Get.to(Info());
                            }),
                        MenuWidget(
                          title: "Logout",
                          icon: Icons.logout_outlined,
                          textColor: Colors.red,
                          endIcon: false,
                          onPress: () {
                            AuthenticationRepository.instance.logout();
                          },
                        ),
                      ],
                    ),
                  );
                } else {
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
            //       } else if (snapshot.hasError) {
            //         return Center(child: Text(snapshot.error.toString()));
            //       } else {
            //         return const Center(child: Text('Somthing went wrong.'));
            //       }
            //     } else {
            //       return const Center(child: CircularProgressIndicator());
            //     }
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
