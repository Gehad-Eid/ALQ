import 'package:alqgp/Src/Utils/Consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class BookmarkCardWithDelete extends StatelessWidget {
  const BookmarkCardWithDelete({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: tDefaultPadding),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Slidable(
          endActionPane: ActionPane(motion: StretchMotion(), children: [
            SlidableAction(
              onPressed: ((Context) {}),
              icon: Icons.bookmark_remove_rounded,
              backgroundColor: Colors.red,
            ),
          ]),
          child: Container(
            color: tPrimaryColor,
            child: ListTile(
              title: Text('lesson name',
                  style: Theme.of(context).textTheme.headline5), //color:white
              subtitle: Text('Chapter name'),
              leading:
                  Icon(Icons.heart_broken_rounded, size: 50), // chap photo here
            ),
          ),
        ),
      ),
    );
  }
}
