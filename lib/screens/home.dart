import 'package:flutter/material.dart';
import 'package:sellerlegend/widgets/DayBox.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 15.0,
          mainAxisSpacing: 15.0,
        ),
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Product();
        });
  }
}
