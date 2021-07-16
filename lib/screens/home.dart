import 'package:flutter/material.dart';
import 'package:sellerlegend/widgets/DayBox.dart';
import 'package:sellerlegend/screens/allProducts.dart';

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
          SizedBox(),
          SizedBox(
            height: MediaQuery.of(context).size.height - 250,
            child: DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: PreferredSize(
                  preferredSize: Size.fromHeight(70.0),
                  child: AppBar(
                    bottom: TabBar(
                      tabs: [
                        Tab(icon: Icon(Icons.border_all)),
                        Tab(icon: Icon(Icons.directions_transit)),
                        Tab(icon: Icon(Icons.directions_bike)),
                      ],
                    ),
                    title: Text('Sanawat Sellerlegend'),
                  ),
                ),
                body: TabBarView(
                  children: [
                    ProductsScreen(),
                    Center(
                      child: TextButton(
                        child: Text('Click here'),
                        onPressed: () =>
                            Navigator.of(context).pushNamed('Test'),
                      ),
                    ),
                    Center(child: Text('TAB 3')),
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
