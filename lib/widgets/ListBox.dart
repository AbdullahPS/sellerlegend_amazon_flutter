import 'package:flutter/material.dart';
import '../utilities/mListBuilder.dart';

class ListBox extends StatelessWidget {
  ListBox(this.title, this.mList);
  final String title;
  final List<String> mList;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text(
                title,
                style: TextStyle(color: Colors.yellow),
              ),
            ),
            ListBuilder(mList),
          ]),
    );
  }
}
