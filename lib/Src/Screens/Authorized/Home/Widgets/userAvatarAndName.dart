import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:flutter/material.dart';

class PeerRankWithAvatarAndName extends StatelessWidget {
  const PeerRankWithAvatarAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
        Container(
          height: tRankAvatarHeight,
          child: ListView(
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              UserWithAvatarAndName(),
              const SizedBox(width: tDefaultPadding),
              UserWithAvatarAndName(),
              const SizedBox(width: tDefaultPadding),
              UserWithAvatarAndName(),
              const SizedBox(width: tDefaultPadding),
              UserWithAvatarAndName(),
              const SizedBox(width: tDefaultPadding),
              UserWithAvatarAndName(),
              const SizedBox(width: tDefaultPadding),
              UserWithAvatarAndName(),
              const SizedBox(width: tDefaultPadding),
              UserWithAvatarAndName(),
            ],
          ),
        ),
      ],
    );
  }
}

class UserWithAvatarAndName extends StatelessWidget {
  const UserWithAvatarAndName({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 100,
      child: Column(
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('images/muscular.png'),
            radius: 39,
          ),
          Text('name', style: Theme.of(context).textTheme.headline6),
        ],
      ),
    );
  }
}
