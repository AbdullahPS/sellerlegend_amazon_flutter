import 'package:flutter/material.dart';

class mTable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Table(
      border: TableBorder(
          horizontalInside: BorderSide(
              width: 2, color: Colors.blue, style: BorderStyle.solid)),
      children: [
        TableRow(children: [
          Column(children: [
            Padding(
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  'Orders',
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: Text('b'),
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
                  textAlign: TextAlign.right,
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: Text('b'),
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
                  textAlign: TextAlign.right,
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: Text('b'),
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
                  textAlign: TextAlign.right,
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: Text('b'),
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
                  textAlign: TextAlign.right,
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            )
          ]),
          FittedBox(
            child: Text('b'),
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
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: Text('b'),
            fit: BoxFit.scaleDown,
          )
        ]),
      ],
    );
  }
}
