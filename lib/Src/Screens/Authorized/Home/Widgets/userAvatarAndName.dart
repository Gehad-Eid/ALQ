import 'package:alqgp/Src/Models/user_model.dart';
import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PeerRankWithAvatarAndName extends StatelessWidget {
  const PeerRankWithAvatarAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(tHomeHeading2, style: Theme.of(context).textTheme.headline5),
            TextButton(
                onPressed: () => {},
                child:
                    Text(tSeeAll, style: Theme.of(context).textTheme.headline5))
          ],
        ),
        const SizedBox(height: tDefaultPadding),

        //the avatar and name
        FutureBuilder(
          future: controller.getAllUsers(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<UserModel> userData = snapshot.data as List<UserModel>;
                return SizedBox(
                  height: 110,
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: userData.length,
                      itemBuilder: (context, index) {
                        return Container(
                          // height: 100,
                          child: Column(
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage('images/muscular.png'),
                                radius: 39,
                              ),
                              //break line
                              Text(userData[index].fullName!,
                                  style: Theme.of(context).textTheme.headline6),
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
    );
  }
}
