import 'package:flutter/material.dart';

class BoxTable extends StatelessWidget {
  List<SummaryCard> card = [
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
    return ListView.builder(
        itemCount: 6,
        itemBuilder: (BuildContext context, int index) {
          SummaryCard current = card.elementAt(index);
          return Container(
          لإ  height: 20,
            child: Card(
              elevation: 4,
              child: ListTile(
                title: SelectableText(current.name),
                // subtitle: Text(current.brand),
                trailing: SelectableText(current.value.toString() + " \$"),
                //leading: Text(current.year),
              ),
            ),
          );
        });

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

class SummaryCard {
  final String name;
  final String value;
  SummaryCard(this.name, this.value);
}
