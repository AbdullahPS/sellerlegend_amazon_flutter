import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //padding: EdgeInsets.all(20),
      child: Card(
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        child: Column(
          children: <Widget>[
            const ListTile(
              title: Text('Today'),
              subtitle: Text('von 1.1. bis 12.1'),
              trailing: Icon(Icons.list),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  Container(
                    width: MediaQuery.of(context).size.width / 8,
                    padding: EdgeInsets.symmetric(vertical: 10.0),
                    child: Table(
                      border: TableBorder(
                          horizontalInside: BorderSide(
                              width: 1,
                              color: Colors.blue,
                              style: BorderStyle.solid)),
                      children: [
                        TableRow(children: [
                          Column(children: [
                            Text(
                              'Orders',
                            ),
                          ]),
                          Text('b')
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Text(
                              'Units',
                              textAlign: TextAlign.right,
                            ),
                          ]),
                          Text('b')
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Text(
                              'Promo',
                              textAlign: TextAlign.right,
                            ),
                          ]),
                          Text('b')
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Text(
                              'Refunds',
                              textAlign: TextAlign.right,
                            ),
                          ]),
                          Text('b')
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Text(
                              'Net Margin',
                              textAlign: TextAlign.right,
                            ),
                          ]),
                          Text('b')
                        ]),
                        TableRow(children: [
                          Column(children: [
                            Text(
                              'ROI',
                              textAlign: TextAlign.right,
                            ),
                          ]),
                          Text('b')
                        ]),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
