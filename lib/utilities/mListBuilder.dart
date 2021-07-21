import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

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
            color: Color(0xFF212332),
            elevation: 4, // Change this
            shadowColor: Colors.red, // Change this
            // In many cases, the key isn't mandatory
            key: UniqueKey(),
            child: Padding(
                padding: EdgeInsets.all(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.architecture,
                      size: 15,
                      color: Colors.red,
                    ),
                    SelectableText(
                      content[index],
                      style: TextStyle(color: Colors.white70),
                    ),
                    Spacer(),
                    SelectableText(
                      'value',
                      textAlign: TextAlign.end,
                      style: TextStyle(color: Colors.white70),
                    )
                  ],
                )),
          );
        });
  }
}
