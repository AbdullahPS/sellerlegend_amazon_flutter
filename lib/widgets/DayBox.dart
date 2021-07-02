import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Card(
      semanticContainer: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 5,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Expanded(
            child: ListTile(
              title: Text('Today'),
              subtitle: Text('von 1.1. bis 12.1'),
              trailing: Icon(Icons.list),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Text(
                      '100 000',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('Ordered Product Sales'),
                    Text(
                      '100 000',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('Revenue'),
                    Text(
                      '100 000',
                      style: TextStyle(fontSize: 20),
                    ),
                    Text('Estimated Profit'),
                  ],
                ),
                Expanded(
                  child: Table(
                    border: TableBorder(
                        horizontalInside: BorderSide(
                            width: 2,
                            color: Colors.blue,
                            style: BorderStyle.solid)),
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
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
