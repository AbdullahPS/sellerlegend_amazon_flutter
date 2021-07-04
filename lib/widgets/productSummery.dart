import 'package:flutter/material.dart';

class productSummery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '100 000',
            style: TextStyle(fontSize: 10),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Ordered Product Sales',
            textAlign: TextAlign.center,
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '100 000',
            style: TextStyle(fontSize: 10),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('Revenue'),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '100 000',
            style: TextStyle(fontSize: 10),
          ),
        ),
        FittedBox(fit: BoxFit.scaleDown, child: Text('Estimated Profit')),
      ],
    );
  }
}
