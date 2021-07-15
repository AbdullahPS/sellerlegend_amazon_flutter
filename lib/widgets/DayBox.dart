import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:sellerlegend/widgets/table.dart';
import 'package:sellerlegend/widgets/productSummery.dart';
import '../utilities/dateCalculator.dart';

class Product extends StatelessWidget {
  Product(this.index);
  final int index;
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
              title: FittedBox(
                child: Text(getWeekday(getDay().weekday + index)),
                fit: BoxFit.scaleDown,
              ),
              subtitle: FittedBox(
                child:
                    Text(getDate(0 + index) + '   -   ' + getDate(1 + index)),
                fit: BoxFit.scaleDown,
              ),
              trailing: Icon(Icons.list),
            ),
          ),
          Expanded(
            flex: 2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: productSummery(),
                ),
                Expanded(
                  child: mTable(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
