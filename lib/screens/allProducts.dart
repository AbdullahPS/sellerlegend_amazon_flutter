import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import '../models/product.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class ProductsScreen extends StatefulWidget {
  ProductsScreen({Key? key}) : super(key: key);

  @override
  _ProductsScreenState createState() => _ProductsScreenState();
}

class _ProductsScreenState extends State<ProductsScreen> {
  HDTRefreshController _hdtRefreshController = HDTRefreshController();

  static const int sortName = 0;
  static const int sortStatus = 1;
  bool isAscending = true;
  int sortType = sortName;

  @override
  void initState() {
    if (dummy.productInfo.isEmpty) dummy.initData(100);
    super.initState();
  }

  final tab = new TabBar(tabs: <Tab>[
    new Tab(text: 'All Products'),
    new Tab(text: 'All Products'),
    new Tab(text: 'All Products'),
  ]);
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: new PreferredSize(
          preferredSize: tab.preferredSize,
          child: new Card(
            elevation: 26.0,
            color: Theme.of(context).primaryColor,
            child: tab,
          ),
        ), //itle: SelectableText(widget.title),

        body: _getBodyWidget(),
      ),
    );
  }

  Widget _getBodyWidget() {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: HorizontalDataTable(
        leftHandSideColumnWidth: screenWidth / 2,
        rightHandSideColumnWidth: screenWidth / 2,
        isFixedHeader: true,
        headerWidgets: _getTitleWidget(),
        leftSideItemBuilder: _generateFirstColumnRow,
        rightSideItemBuilder: _generateRightHandSideColumnRow,
        itemCount: dummy.productInfo.length,
        rowSeparatorWidget: const Divider(
          color: Colors.black54,
          height: 1.0,
          thickness: 0.0,
        ),
        leftHandSideColBackgroundColor: Color(0xFF2A2D3E),
        rightHandSideColBackgroundColor: Color(0xFF2A2D3E),
        verticalScrollbarStyle: const ScrollbarStyle(
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),
        horizontalScrollbarStyle: const ScrollbarStyle(
          isAlwaysShown: true,
          thickness: 4.0,
          radius: Radius.circular(5.0),
        ),
        enablePullToRefresh: true,
        refreshIndicator: const WaterDropHeader(),
        refreshIndicatorHeight: 60,
        onRefresh: () async {
          //Do sth
          await Future.delayed(const Duration(milliseconds: 500));
          _hdtRefreshController.refreshCompleted();
        },
        htdRefreshController: _hdtRefreshController,
      ),
      height: MediaQuery.of(context).size.height,
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget(
            'Name' + (sortType == sortName ? (isAscending ? '↓' : '↑') : ''),
            100),
        onPressed: () {
          sortType = sortName;
          isAscending = !isAscending;
          dummy.sortName(isAscending);
          setState(() {});
        },
      ),
      TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
        ),
        child: _getTitleItemWidget(
            'Status' +
                (sortType == sortStatus ? (isAscending ? '↓' : '↑') : ''),
            100),
        onPressed: () {
          sortType = sortStatus;
          isAscending = !isAscending;
          dummy.sortStatus(isAscending);
          setState(() {});
        },
      ),
      _getTitleItemWidget('Asin', 200),
      _getTitleItemWidget('SKU', 100),
      _getTitleItemWidget('Price', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: SelectableText(label,
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white70)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return Container(
      child: ListTile(
        leading: Image.network(
            'https://m.media-amazon.com/images/I/61+4FFxW6iS._AC_SL1284_.jpg'),
        title: SelectableText(
          dummy.productInfo[index].name,
          style: TextStyle(color: Colors.white70),
        ),
      ),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Icon(
                  dummy.productInfo[index].status
                      ? Icons.notifications_off
                      : Icons.notifications_active,
                  color: dummy.productInfo[index].status
                      ? Colors.red
                      : Colors.green),
              SelectableText(
                dummy.productInfo[index].status ? 'Disabled' : 'Active',
                style: TextStyle(color: Colors.white70),
              )
            ],
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: SelectableText(
            dummy.productInfo[index].sku,
            style: TextStyle(color: Colors.white70),
          ),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: SelectableText(
            dummy.productInfo[index].asin,
            style: TextStyle(color: Colors.white70),
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: SelectableText(
            dummy.productInfo[index].price,
            style: TextStyle(color: Colors.white70),
          ),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
      ],
    );
  }
}

//Product product = Product();
DummyProduct dummy = DummyProduct();

class DummyProduct {
  List<Product> productInfo = [];

  void initData(int size) {
    for (int i = 0; i < size; i++) {
      productInfo.add(
        Product(
          "Product_$i",
          i % 3 == 0,
          'x Dollar',
          'SKU_$i',
          'Asin_$i',
        ),
      );
    }
  }

  ///
  /// Single sort, sort Name's id
  void sortName(bool isAscending) {
    productInfo.sort((a, b) {
      int aId = int.tryParse(a.name.replaceFirst('Product_', '')) ?? 0;
      int bId = int.tryParse(b.name.replaceFirst('Product_', '')) ?? 0;
      return (aId - bId) * (isAscending ? 1 : -1);
    });
  }

  ///
  /// sort with Status and Name as the 2nd Sort
  void sortStatus(bool isAscending) {
    productInfo.sort((a, b) {
      if (a.status == b.status) {
        int aId = int.tryParse(a.name.replaceFirst('Product_', '')) ?? 0;
        int bId = int.tryParse(b.name.replaceFirst('Product_', '')) ?? 0;
        return (aId - bId);
      } else if (a.status) {
        return isAscending ? 1 : -1;
      } else {
        return isAscending ? -1 : 1;
      }
    });
  }
}
