import 'package:flutter/material.dart';

class productSummery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          '100 000',
          style: TextStyle(fontSize: 10),
        ),
        Text(
          'Ordered Product Sales',
          textAlign: TextAlign.center,
        ),
        Text(
          '100 000',
          style: TextStyle(fontSize: 10),
        ),
        Text('Revenue'),
        Text(
          '100 000',
          style: TextStyle(fontSize: 10),
        ),
        Text('Estimated Profit'),
      ],
    );
  }
}
