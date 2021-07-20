import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:sellerlegend/widgets/table.dart';
import 'package:sellerlegend/widgets/productSummery.dart';
import '../utilities/dateCalculator.dart';

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
  bool cardThreeChanged = false;
  bool cardFourChanged = false;
  String newDate = '';

  @override
  Widget build(BuildContext context) {
    String getNewDate(DateTimeRange d) {
      List<String> splittedArray = d.toString().split(" - ");
      //print(splittedArray);
      splittedArray.forEach((element) {
        print(element.replaceAll('00:00:00.000', ''));
        element.replaceAll('00:00:00.000', '');
      });

      return splittedArray[0] = splittedArray[1];
    }

    Future<void> showDateDialog(BuildContext context, int index) async {
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
      dateRange = newDateRange;
      String s = getNewDate(dateRange);

      setState(() {
        newDate = s;
        dateRange = newDateRange;
        if (widget.index == 2) cardThreeChanged = true;
        if (widget.index == 3) cardFourChanged = true;
      });
      //print(dateRange);

      /*mDate first= new mDate(year, month, day);
      mDate second= new mDate(year, month, day);*/
    }

    String printHeadLine(int index) {
      if (index == 0 || index == 1)
        return cardArray[index];
      else if (index == 2) {
        if (!cardThreeChanged)
          return cardArray[index];
        else
          return newDate;
      } else if (index == 3) {
        if (!cardFourChanged)
          return cardArray[index];
        else
          return newDate;
      }
      return '';
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
                    printHeadLine(widget.index),
                    style: TextStyle(color: Colors.yellow),
                  ),
                  fit: BoxFit.scaleDown,
                ),
                subtitle: FittedBox(
                  child: Text(getDateFromIndex(widget.index),
                      style: TextStyle(color: Colors.yellow[700])),
                  fit: BoxFit.scaleDown,
                ),
                trailing: widget.index == 2 || widget.index == 3
                    ? PopupMenuButton(
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
                                  onPressed: () =>
                                      showDateDialog(context, widget.index),
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
                            ])
                    : null,
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

class mDate {
  final int year;
  final int month;
  final int day;
  mDate(this.year, this.month, this.day);
}
