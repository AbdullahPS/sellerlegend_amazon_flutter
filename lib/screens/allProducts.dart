import 'package:flutter/material.dart';
import 'package:horizontal_data_table/horizontal_data_table.dart';
import 'package:sellerlegend/models/product.dart';
import '../models/productdummyList.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';

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

  final controller =
      new TextEditingController(); //controller for search text field

  @override
  void initState() {
    if (DummyProduct.productInfo.isEmpty) DummyProduct.initData(100);
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

        body: Column(children: [
          Text(
            "Search for your car",
            style: TextStyle(color: Colors.white70),
          ),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                //controller: controller),
                decoration:
                    InputDecoration(fillColor: Colors.orange, filled: true),
              )),
          _getBodyWidget()
        ]),
      ),
    );
  }

  Widget _getBodyWidget() {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      child: Padding(
        padding: EdgeInsets.all(20),
        child: HorizontalDataTable(
          leftHandSideColumnWidth: screenWidth / 2,
          rightHandSideColumnWidth: screenWidth / 2,
          isFixedHeader: true,
          headerWidgets: _getTitleWidget(),
          leftSideItemBuilder: _generateFirstColumnRow,
          rightSideItemBuilder: _generateRightHandSideColumnRow,
          itemCount: DummyProduct.productInfo.length,
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
          DummyProduct.sortName(isAscending);
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
          DummyProduct.sortStatus(isAscending);
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
          DummyProduct.productInfo[index].name,
          style: TextStyle(color: Colors.white70),
        ),
      ),
      width: 100,
      height: 52,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget buildFloatingSearchBar(BuildContext context) {
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return FloatingSearchBar(
      hint: 'Search...',
      scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
      transitionDuration: const Duration(milliseconds: 800),
      transitionCurve: Curves.easeInOut,
      physics: const BouncingScrollPhysics(),
      axisAlignment: isPortrait ? 0.0 : -1.0,
      openAxisAlignment: 0.0,
      width: isPortrait ? 600 : 500,
      debounceDelay: const Duration(milliseconds: 500),
      onQueryChanged: (query) {
        // Call your model, bloc, controller here.
      },
      // Specify a custom transition to be used for
      // animating between opened and closed stated.
      transition: CircularFloatingSearchBarTransition(),
      actions: [
        FloatingSearchBarAction(
          showIfOpened: false,
          child: CircularButton(
            icon: const Icon(Icons.place),
            onPressed: () {},
          ),
        ),
        FloatingSearchBarAction.searchToClear(
          showIfClosed: false,
        ),
      ],
      builder: (context, transition) {
        return ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Material(
            color: Colors.white,
            elevation: 4.0,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: Colors.accents.map((color) {
                return Container(height: 112, color: color);
              }).toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return Row(
      children: <Widget>[
        Container(
          child: Row(
            children: <Widget>[
              Icon(
                  DummyProduct.productInfo[index].status
                      ? Icons.notifications_off
                      : Icons.notifications_active,
                  color: DummyProduct.productInfo[index].status
                      ? Colors.red
                      : Colors.green),
              SelectableText(
                DummyProduct.productInfo[index].status ? 'Disabled' : 'Active',
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
            DummyProduct.productInfo[index].sku,
            style: TextStyle(color: Colors.white70),
          ),
          width: 200,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: SelectableText(
            DummyProduct.productInfo[index].asin,
            style: TextStyle(color: Colors.white70),
          ),
          width: 100,
          height: 52,
          padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
          alignment: Alignment.centerLeft,
        ),
        Container(
          child: SelectableText(
            DummyProduct.productInfo[index].price,
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
