import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../widgets/ListBox.dart';

class StatisticsTab extends StatefulWidget {
  const StatisticsTab({Key? key}) : super(key: key);

  @override
  _StatisticsTabState createState() => _StatisticsTabState();
}

class _StatisticsTabState extends State<StatisticsTab> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 4,
      height: 500,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: SizedBox(
              child: Container(
                width: 700,
                child: ListBox('Revenue', ['Promo Sales', 'Organic Sales']),
                decoration: BoxDecoration(
                  color: Color(0xFF2A2D3E),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  /*  boxShadow: [
                    new BoxShadow(
                      color: Colors.yellow.shade800,
                      offset: new Offset(10.0, 10.0),
                    ),
                  ],*/
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(15, 2, 15, 15),
            child: SizedBox(
              child: Container(
                //height: 300,
                width: 700,
                child: ListBox('Costs', [
                  'Promotions',
                  'Cost of Goods',
                  'Amazon Fees',
                  'Remitting Fax',
                  'Sponsored Product Costs',
                  'Sponsored Brand Cost',
                  'Operating Expenses',
                  'Miscellaneous Cost',
                ]),
                decoration: BoxDecoration(
                  color: Color(0xFF212332),
                  border: Border.all(
                    color: Colors.black,
                    width: 2,
                  ),
                  borderRadius: BorderRadius.circular(10),
                  /*  boxShadow: [
                    new BoxShadow(
                      color: Color(0xffffc947),
                      offset: new Offset(10.0, 10.0),
                    ),
                  ],*/
                ),
              ),
            ),
          ),
          /*Expanded(
            child: Text('test3'),
            flex: 1,
          ),*/
        ],
      ),
    );
  }
}
