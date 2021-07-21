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
                child: SelectableText(
                  'Orders',
                  style: TextStyle(color: Colors.white70),
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: SelectableText(
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
                child: SelectableText(
                  'Units',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: SelectableText(
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
                child: SelectableText(
                  'Promo',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: SelectableText(
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
                child: SelectableText(
                  'Refunds',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          FittedBox(
            child: SelectableText(
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
                child: SelectableText(
                  'Net Margin',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
              ),
              padding: EdgeInsets.only(top: 3),
            )
          ]),
          FittedBox(
            child: SelectableText(
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
                  child: SelectableText(
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
            child: SelectableText(
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
