import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:alqgp/Src/Widgets/backButton.dart';
import 'package:flutter/material.dart';

class FAQ extends StatelessWidget {
  const FAQ({super.key});

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
              child: Text("FAQ", style: Theme.of(context).textTheme.headline5),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(tDefaultScreenPadding),
            margin: const EdgeInsets.only(top: tDefaultSpacing * 2),
            child: Column(children: [
              //title
              Text("Here is the answers of the most asked questions",
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
                        height: 150,
                        width: size.width,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(faqQuestionsText[index],
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1),
                              const SizedBox(height: 15),
                              Text(faqAnswersText[index],
                                  textAlign: TextAlign.left,
                                  style: Theme.of(context).textTheme.bodyText2),
                            ],
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(height: 15);
                    },
                    physics: const BouncingScrollPhysics(),
                    itemCount: faqAnswersText.length),
              )
            ]),
          ),
        ],
      ),
    ));
  }
}
