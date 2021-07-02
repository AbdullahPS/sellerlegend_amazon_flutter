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
              child: Text(
                'Orders',
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          Text('b')
        ]),
        TableRow(children: [
          Column(children: [
            Padding(
              child: Text(
                'Units',
                textAlign: TextAlign.right,
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          Text('b')
        ]),
        TableRow(children: [
          Column(children: [
            Padding(
              child: Text(
                'Promo',
                textAlign: TextAlign.right,
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          Text('b')
        ]),
        TableRow(children: [
          Column(children: [
            Padding(
              child: Text(
                'Refunds',
                textAlign: TextAlign.right,
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          Text('b')
        ]),
        TableRow(children: [
          Column(children: [
            Padding(
              child: Text(
                'Net Margin',
                textAlign: TextAlign.right,
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          Text('b')
        ]),
        TableRow(children: [
          Column(children: [
            Padding(
              child: Text(
                'ROI',
                textAlign: TextAlign.right,
              ),
              padding: EdgeInsets.only(top: 3),
            ),
          ]),
          Text('b')
        ]),
      ],
    );
  }
}
