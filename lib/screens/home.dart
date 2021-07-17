import 'package:flutter/material.dart';
import 'package:sellerlegend/widgets/DayBox.dart';
import 'package:sellerlegend/screens/allProducts.dart';
import 'statistics.dart';

class Home extends StatelessWidget {
  static const routePathName = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Padding(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
            child: SizedBox(
              height: 250,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 25.0,
                    mainAxisSpacing: 25.0,
                    childAspectRatio: MediaQuery.of(context).size.width /
                        (MediaQuery.of(context).size.height),
                  ),
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return Product(index);
                  }),
            ),
          ),
          SizedBox(
            height: 2000,
            child: DefaultTabController(
              length: 10,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(75.0),
                  child: AppBar(
                    bottom: TabBar(
                      tabs: [
                        Tab(text: 'All Products'),
                        Tab(text: 'Dashboard'),
                        Tab(text: 'Inventory'),
                        Tab(text: 'Sales'),
                        Tab(text: 'Customers'),
                        Tab(text: 'Refund Manager'),
                        Tab(text: 'Reports'),
                        Tab(text: 'PPC'),
                        Tab(text: 'Quality KPI'),
                        Tab(text: 'Warehouse List'),
                      ],
                    ),
                    title: Text('Sanawat Sellerlegend'),
                  ),
                ),
                body: TabBarView(
                  children: [
                    ProductsScreen(),
                    StatisticsTab(),
                    StatisticsTab(),
                    StatisticsTab(),
                    StatisticsTab(),
                    StatisticsTab(),
                    StatisticsTab(),
                    StatisticsTab(),
                    StatisticsTab(),
                    Center(
                      child: TextButton(
                        child: Text('Click here'),
                        onPressed: () =>
                            Navigator.of(context).pushNamed('Test'),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
