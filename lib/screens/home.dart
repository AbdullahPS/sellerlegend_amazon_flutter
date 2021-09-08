import 'package:flutter/material.dart';
import 'package:sellerlegend/screens/orders.dart';
import 'package:sellerlegend/widgets/DayBox.dart';
import 'package:sellerlegend/screens/allProducts.dart';
import 'statistics.dart';
import 'salesScree.dart';

class Home extends StatelessWidget {
  static const routePathName = 'Home';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MaterialApp(
        theme: ThemeData(scaffoldBackgroundColor: Color(0xff001a33)),
        home: SingleChildScrollView(
          child: Container(
            color: Color(0xff001a33),
            child: Column(children: [
              Padding(
                padding: EdgeInsets.fromLTRB(15, 15, 15, 0),
                child: SizedBox(
                  height: 250,
                  child: GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: getItemCount(
                            MediaQuery.of(context).size.width, context),
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
                            Tab(text: 'DashBoard'),
                            Tab(text: 'Products'),
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
                        backgroundColor: Color(0xff001a33),
                      ),
                    ),
                    body: TabBarView(
                      children: [
                        StatisticsTab(),
                        ProductsScreen(),
                        StatisticsTab(),
                        Example1(),
                        StatisticsTab(),
                        StatisticsTab(),
                        StatisticsTab(),
                        // StatisticsTab(),
                        OrdersPage(),
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
        ),
      ),
    );
  }

  int getItemCount(double width, BuildContext context) {
    int count = 4;
    if (MediaQuery.of(context).size.width <= 960 &&
        MediaQuery.of(context).size.width > 640)
      count = 3;
    else if (MediaQuery.of(context).size.width <= 640) count = 2;

    return count;
  }
}
