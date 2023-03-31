import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          backButton(),
          //title
          Positioned(
            top: tDefaultSize,
            left: 0,
            right: 0,
            child: Center(
              child: Text("About Us",
                  style: Theme.of(context).textTheme.headline5),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(tDefaultScreenPadding),
            margin: const EdgeInsets.only(top: tDefaultSpacing * 2),
            child: Column(children: [
              //title
              Text("Who we are and what we do, know about ALQ more",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyText1),
              const SizedBox(height: tDefaultSize),

              // asbout us cards
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return Container(
                        padding: const EdgeInsets.all(tDefaultPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(tCardRadius),
                          color: tPrimaryColor,
                        ),
                        height: 200,
                        width: size.width,
                        child: SingleChildScrollView(
                          child: Text(aboutUsText[index],
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.bodyText1),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 15);
                    },
                    physics: const BouncingScrollPhysics(),
                    itemCount: aboutUsText.length),
              )
            ]),
          ),
        ],
      ),
    ));
  }
}
