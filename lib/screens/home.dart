import 'package:flutter/material.dart';
import 'package:sellerlegend/widgets/DayBox.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 4,
            crossAxisSpacing: 15.0,
            mainAxisSpacing: 15.0,
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height),
          ),
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return Product();
          }),
    );
  }
}
