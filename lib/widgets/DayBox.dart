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
    String getHeaderText(index) {
      switch (index) {
        case 0:
        case 1:
          return getDateFromIndex(widget.index);
        case 2:
          return cardThreeChanged ? newDate : getDateFromIndex(index);
        case 3:
          return cardFourChanged ? newDate : getDateFromIndex(index);
        default:
          return '';
      }
    }

    String getNewDate(DateTimeRange d) {
      List<String> splittedArray = d.toString().split(" - ");
      List<DateTime> removedZerosArray = splittedArray.map((element) {
        element.replaceAll('00:00:00.000', '');
        return DateTime.parse(element);
      }).toList();

      return getDayFromString(removedZerosArray);
    }

    revertToDefault() {
      setState(() {
        if (widget.index == 2) cardThreeChanged = false;
        if (widget.index == 3) cardFourChanged = false;
      });
    }

    Future<void> showDateDialog(BuildContext context, int index) async {
      final newDateRange = await showDateRangePicker(
        context: context,
        //allow user only to pick 3 years in the past
        firstDate: DateTime(DateTime.now().year),
        lastDate: DateTime(DateTime.now().year + 1),
        currentDate: DateTime.now(),
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
          return 'Custom Data Range';
      } else if (index == 3) {
        if (!cardFourChanged)
          return cardArray[index];
        else
          return 'Custom Data Range';
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
                  child: Text(getHeaderText(widget.index),
                      style: TextStyle(color: Colors.yellow[700])),
                  fit: BoxFit.scaleDown,
                ),
                trailing: widget.index == 2 || widget.index == 3
                    ? PopupMenuButton(
                        child: Icon(
                          Icons.list,
                          color: Colors.white70,
                        ),
                        onSelected: (value) {
                          switch (value) {
                            case 1:
                              showDateDialog(context, widget.index);
                              break;
                            case 2:
                              revertToDefault();
                              break;
                          }
                        },
                        itemBuilder: (context) => [
                              PopupMenuItem(
                                child: Text(
                                  "Change Date Range",
                                  style: TextStyle(fontSize: 10),
                                ),
                                value: 1,
                              ),
                              PopupMenuItem(
                                child: Text(
                                  "Revert to default",
                                  style: TextStyle(fontSize: 10),
                                ),
                                value: 2,
                              ),
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
}

class mDate {
  final int year;
  final int month;
  final int day;
  mDate(this.year, this.month, this.day);
}
