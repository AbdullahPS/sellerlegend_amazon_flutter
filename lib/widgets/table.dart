import 'package:flutter/material.dart';

class BoxTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
          horizontalInside: BorderSide(
              width: 2, color: Colors.red, style: BorderStyle.solid)),
      children: [
        TableRow(children: [
          Column(children: [
            Padding(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Orders',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: Text(
              'b',
              style: TextStyle(color: Colors.white70),
            ),
            fit: BoxFit.scaleDown,
          )
        ]),
        TableRow(children: [
          Column(children: [
            Padding(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Units',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: Text(
              'b',
              style: TextStyle(color: Colors.white70),
            ),
            fit: BoxFit.scaleDown,
          )
        ]),
        TableRow(children: [
          Column(children: [
            Padding(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Promo',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: Text(
              'b',
              style: TextStyle(color: Colors.white70),
            ),
            fit: BoxFit.scaleDown,
          )
        ]),
        TableRow(children: [
          Column(children: [
            Padding(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Refunds',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: Text(
              'b',
              style: TextStyle(color: Colors.white70),
            ),
            fit: BoxFit.scaleDown,
          )
        ]),
        TableRow(children: [
          Column(children: [
            Padding(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Net Margin',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            )
          ]),
          FittedBox(
            child: Text(
              'b',
              style: TextStyle(color: Colors.white70),
            ),
            fit: BoxFit.scaleDown,
          )
        ]),
        TableRow(children: [
          Column(children: [
            Padding(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: FittedBox(
                  child: Text(
                    'ROI',
                    style: TextStyle(color: Colors.white70),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: Text(
              'b',
              style: TextStyle(color: Colors.white70),
            ),
            fit: BoxFit.scaleDown,
          )
        ]),
      ],
    );
  }
}
