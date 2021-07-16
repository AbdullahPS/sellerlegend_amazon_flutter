import 'package:flutter/material.dart';

class ListBuilder extends StatelessWidget {
  ListBuilder(this.content);

  final List<String> content;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        // the number of items in the list
        itemCount: content.length,

        // display each item of the product list
        itemBuilder: (context, index) {
          return Card(
            // In many cases, the key isn't mandatory
            key: UniqueKey(),
            child: Padding(
                padding: EdgeInsets.all(1), child: Text(content[index])),
          );
        });
  }
}
