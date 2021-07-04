import 'package:flutter/material.dart';
import 'package:sellerlegend/widgets/DayBox.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        SizedBox(
          height: 250,
          child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                crossAxisSpacing: 15.0,
                mainAxisSpacing: 15.0,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height),
              ),
              itemCount: 4,
              itemBuilder: (BuildContext context, int index) {
                return Product();
              }),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height - 250,
          child: DefaultTabController(
            length: 3,
            child: Scaffold(
              appBar: AppBar(
                bottom: TabBar(
                  tabs: [
                    Tab(icon: Icon(Icons.directions_car)),
                    Tab(icon: Icon(Icons.directions_transit)),
                    Tab(icon: Icon(Icons.directions_bike)),
                  ],
                ),
                title: Text('Sanawat Sellerlegend'),
              ),
              body: TabBarView(
                children: [
                  Center(child: Text('ALLE PRODUKTE')),
                  Center(
                    child: FlatButton(
                      child: Text('Click here'),
                      onPressed: Navigator.of(context).pushNamed('testpage'),
                    ),
                  ),
                  Center(child: Text('TAB 3')),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
