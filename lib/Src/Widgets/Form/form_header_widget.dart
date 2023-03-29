import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/image_paths.dart';
import 'package:flutter/material.dart';

class FormHeaderWidget extends StatelessWidget {
  const FormHeaderWidget({
    Key? key,
    this.imageColor,
    this.heightBetween,
    required this.image,
    required this.title,
    required this.subTitle,
    this.textAlign,
  }) : super(key: key);

  //Variables -- Declared in Constructor
  final Color? imageColor;
  final double? heightBetween;
  final String image, title, subTitle;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(

            /// ********** change photo
            image: AssetImage(tLogo),
            color: imageColor,
            height: size.height * 0.3),
        SizedBox(height: heightBetween),
        Text(title, style: Theme.of(context).textTheme.headline4),
        const SizedBox(height: tDefaultPadding - 5),
        Text(subTitle,
            textAlign: textAlign, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}
