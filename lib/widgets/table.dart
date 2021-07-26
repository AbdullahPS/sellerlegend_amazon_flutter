import 'package:flutter/material.dart';

class BoxTable extends StatelessWidget {
  final List<SummaryCard> card = [
    SummaryCard('Orders', 's'),
    SummaryCard('Units', 's'),
    SummaryCard('Refunds', 's'),
    SummaryCard('Net Margin', 's'),
    SummaryCard('ROI', 's'),
    SummaryCard('Promo', 's'),

    /*
         Units
                    'Promo',
                    'Refunds',
                    'Net Margin',
                    'ROI',
    * */
  ];
  @override
  Widget build(BuildContext context) {
    /* return ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          SummaryCard current = card.elementAt(index);
          return Container(
              height: 10,
              padding: EdgeInsets.all(100),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60.0),
                  color: Colors.grey[300]),
              child: Text(current.name,
                  style: Theme.of(context).textTheme.display1));
        });*/

    return SingleChildScrollView(
      child: Table(
        border: TableBorder(
            horizontalInside: BorderSide(
                width: 2, color: Colors.red, style: BorderStyle.solid)),
        children: [
          TableRow(children: [
            Column(children: [
              Padding(
                child: SelectableText(
                  'Orders',
                  style: TextStyle(color: Colors.white70),
                ),
                padding: EdgeInsets.only(top: 3),
              ),
            ]),
            SelectableText(
              'b',
              style: TextStyle(color: Colors.white70),
            )
          ]),
          TableRow(children: [
            Column(children: [
              Padding(
                child: SelectableText(
                  'Units',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.only(top: 3),
              ),
            ]),
            SelectableText(
              'b',
              style: TextStyle(color: Colors.white70),
            )
          ]),
          TableRow(children: [
            Column(children: [
              Padding(
                child: SelectableText(
                  'Promo',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.only(top: 3),
              ),
            ]),
            SelectableText(
              'b',
              style: TextStyle(color: Colors.white70),
            )
          ]),
          TableRow(children: [
            Column(children: [
              Padding(
                child: SelectableText(
                  'Refunds',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.only(top: 3),
              ),
            ]),
            SelectableText(
              'b',
              style: TextStyle(color: Colors.white70),
            )
          ]),
          TableRow(children: [
            Column(children: [
              Padding(
                child: SelectableText(
                  'Net Margin',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.only(top: 3),
              )
            ]),
            SelectableText(
              'b',
              style: TextStyle(color: Colors.white70),
            )
          ]),
          TableRow(children: [
            Column(children: [
              Padding(
                child: SelectableText(
                  'ROI',
                  style: TextStyle(color: Colors.white70),
                  textAlign: TextAlign.right,
                ),
                padding: EdgeInsets.only(top: 3),
              ),
            ]),
            SelectableText(
              'b',
              style: TextStyle(color: Colors.white70),
            )
          ]),
        ],
      ),
    );
  }
}

class SummaryCard {
  final String name;
  final String value;
  SummaryCard(this.name, this.value);
}
