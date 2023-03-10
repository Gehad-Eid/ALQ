import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:flutter/material.dart';

class ProgressChart extends StatelessWidget {
  const ProgressChart({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(tHomeHeading3, style: Theme.of(context).textTheme.headline5),
            TextButton(
                onPressed: () => {},
                child:
                    Text(tSeeAll, style: Theme.of(context).textTheme.headline5))
          ],
        ),
        const SizedBox(height: tDefaultPadding),
        //************** chart here */
      ],
    );
  }
}
