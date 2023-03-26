import 'package:alqgp/Src/Screens/Authenticate/LogIn/login.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpFooterWidget extends StatelessWidget {
  const SignUpFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("OR"),
        // SizedBox(
        //   width: double.infinity,
        //   child: OutlinedButton.icon(
        //     onPressed: () {},
        //     icon: const Image(
        //       image: AssetImage(tGoogleLogoImage),
        //       width: 20.0,
        //     ),
        //     label: Text(tSignInWithGoogle.toUpperCase()),
        //   ),
        // ),
        TextButton(
          onPressed: () {
            Get.off(() => LoginScreen());
          },
          child: Text.rich(TextSpan(children: [
            TextSpan(
              text: tAlreadyHaveAnAccount,
              style: Theme.of(context).textTheme.bodyText1,
            ),
            TextSpan(text: tLogin.toUpperCase())
          ])),
        )
      ],
    );
  }
}
