import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:alqgp/Src/Utils/Consts/text.dart';
import 'package:flutter/material.dart';

class HomePageHeader extends StatelessWidget {
  const HomePageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: tDefaultScreenPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                // **************change
                tHomeTitle,
                style: TextStyle(fontSize: 28),
              ),
              Text(
                'Name',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ), // TextStyle
              ), // Text
            ],
          ),
          // ************* Plus button
          // Container(
          //   padding: EdgeInsets.all(8),
          //   decoration: BoxDecoration(
          //     color: Colors.grey[400],
          //     shape: BoxShape.circle,
          //   ), // BoxDecoration
          //   child: Icon(Icons.add),
          // ),
        ],
      ),
    );
  }
}
