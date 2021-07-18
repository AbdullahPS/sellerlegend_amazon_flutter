import 'package:flutter/material.dart';

class ProductSummery extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '100 000',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white70,
            ),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text('Ordered Product Sales',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white70)),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '100 000',
            style: TextStyle(fontSize: 10, color: Colors.white70),
          ),
        ),
        FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('Revenue', style: TextStyle(color: Colors.white70))),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            '100 000',
            style: TextStyle(
              fontSize: 10,
              color: Colors.white70,
            ),
          ),
        ),
        FittedBox(
          fit: BoxFit.scaleDown,
          child: Text(
            'Estimated Profit',
            style: TextStyle(color: Colors.white70),
          ),
        ),
      ],
    );
  }
}
