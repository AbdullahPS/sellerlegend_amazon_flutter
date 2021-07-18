import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:sellerlegend/widgets/table.dart';
import 'package:sellerlegend/widgets/productSummery.dart';
import '../utilities/dateCalculator.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class Product extends StatefulWidget {
  Product(this.index);
  final int index;

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  DateTimeRange dateRange = DateTimeRange(
    start: DateTime.now(),
    //show initially until a 30 day range from todays date
    end: DateTime.now().add(Duration(days: 30)),
  );
  @override
  Widget build(BuildContext context) {
    Future<void> showDateDialog(BuildContext context) async {
      final initialDate = DateTimeRange(
        start: DateTime.now(),
        //show initially until a 30 day range from todays date
        end: DateTime.now().add(Duration(days: 30)),
      );
      final newDateRange = await showDateRangePicker(
        context: context,
        //allow user only to pick 3 years in the past
        firstDate: DateTime(DateTime.now().year - 3),
        lastDate: DateTime(DateTime.now().year),
        builder: (context, child) {
          return Theme(
            data: ThemeData.light(),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Container(
                    height: 450,
                    width: 450,
                    child: child,
                  ),
                ),
              ],
            ),
          );
        },
        // initialDate: DateTime.now(),
      );
      if (newDateRange == null) return;

      setState(() {
        dateRange = newDateRange;
      });
      print(dateRange);
    }

    return Container(
      child: Card(
        color: Color(0xFF212332),
        elevation: 5, // Change this
        semanticContainer: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: ListTile(
                title: FittedBox(
                  child: Text(
                    cardArray[widget.index],
                    style: TextStyle(color: Colors.yellow),
                  ),
                  fit: BoxFit.scaleDown,
                ),
                subtitle: FittedBox(
                  child: Text(getDateFromIndex(widget.index),
                      style: TextStyle(color: Colors.yellow[700])),
                  fit: BoxFit.scaleDown,
                ),
                trailing: PopupMenuButton(
                    child: Icon(
                      Icons.list,
                      color: Colors.white70,
                    ),
                    itemBuilder: (context) => [
                          PopupMenuItem(
                            child: TextButton(
                              child: Text(
                                "Change Date Range",
                                style: TextStyle(fontSize: 10),
                              ),
                              onPressed: () => showDateDialog(context),
                            ),
                            value: 1,
                          ),
                          PopupMenuItem(
                            child: Text(
                              "Make something else",
                              style: TextStyle(fontSize: 10),
                            ),
                            value: 2,
                          )
                        ]),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ProductSummery(),
                  ),
                  Expanded(
                    child: BoxTable(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
    );
  }

  ///TODO: Implement changing date range
/*  PopupMenuButton(
      {Key key,
        @required PopupMenuItemBuilder<T> itemBuilder,
        T initialValue,
        PopupMenuItemSelected<T> onSelected,
        PopupMenuCanceled onCanceled,
        String tooltip,
        double elevation,
        EdgeInsetsGeometry padding: const EdgeInsets.all(8.0),
        Widget child,
        Widget icon,
        Offset offset: Offset.zero,
        bool enabled: true,
        ShapeBorder shape,
        Color color,
        bool captureInheritedThemes: true}
      )*/
}
