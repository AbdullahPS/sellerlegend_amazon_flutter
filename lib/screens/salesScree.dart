import 'package:flutter/material.dart';

List<Product2> initialList = Product2.product2s;
List<Product2> currentList = [];
bool selfDriving = false;
double maxPrice = 100000;
String carType = "all";
final controller = new TextEditingController();

filterCars() {
/*  // Prepare lists
  List<Car> tmp = [];
  currentList.clear();

  String name = controller.text;
  print("filter cars for name " + name);
  if (name.isEmpty) {
    tmp.addAll(initialList);
  } else {
    for (Car c in initialList) {
      if (c.name.toLowerCase().startsWith(name.toLowerCase())) {
        tmp.add(c);
      }
    }
  }
  currentList = tmp;

  if (selfDriving) {
    tmp = [];
    print("filter cars for selfdriving " + selfDriving.toString());
    for (Product2 p in currentList) {
      if (c.selfDriving == selfDriving) {
        tmp.add(c);
      }
    }
    currentList = tmp;
  }

  print("filter cars for max price " + maxPrice.toString());
  tmp = [];
  for (Car c in currentList) {
    if (c.price < maxPrice) {
      tmp.add(c);
    }
  }
  currentList = tmp;
  if (carType.toLowerCase() != "all") {
    tmp = [];
    print("filter cars for type " + carType);
    for (Car c in cCarurrentList) {
      if (c.type == carType.toLowerCase()) {
        tmp.add(c);
      }
    }
    currentList = tmp;
  }*/
}

//temporararly class will be unified later on ان شاء الله
class Product2 {
  final String name;
  final String asin;
  final String sku;
  final String imageURL;
  final double price;
  final int salesNum;

  Product2({
    required this.name,
    required this.asin,
    required this.sku,
    required this.imageURL,
    required this.price,
    required this.salesNum,
  });

  static final product2s = [
    new Product2(
        name: "Filter",
        asin: "123456",
        sku: "Amz-sku-1",
        imageURL:
            "https://m.media-amazon.com/images/I/91UcJaqi7KL._AC_SL1500_.jpg",
        price: 19.9,
        salesNum: 12),
    new Product2(
        name: "Filter",
        asin: "123456",
        sku: "Amz-sku-1",
        imageURL:
            "https://m.media-amazon.com/images/I/91UcJaqi7KL._AC_SL1500_.jpg",
        price: 19.9,
        salesNum: 12),
    new Product2(
        name: "Filter",
        asin: "123456",
        sku: "Amz-sku-1",
        imageURL:
            "https://m.media-amazon.com/images/I/91UcJaqi7KL._AC_SL1500_.jpg",
        price: 19.9,
        salesNum: 12),
    new Product2(
        name: "Filter",
        asin: "123456",
        sku: "Amz-sku-1",
        imageURL:
            "https://m.media-amazon.com/images/I/91UcJaqi7KL._AC_SL1500_.jpg",
        price: 19.9,
        salesNum: 12),
    new Product2(
        name: "Filter",
        asin: "123456",
        sku: "Amz-sku-1",
        imageURL:
            "https://m.media-amazon.com/images/I/91UcJaqi7KL._AC_SL1500_.jpg",
        price: 19.9,
        salesNum: 12),
    new Product2(
        name: "Filter",
        asin: "123456",
        sku: "Amz-sku-1",
        imageURL:
            "https://m.media-amazon.com/images/I/91UcJaqi7KL._AC_SL1500_.jpg",
        price: 19.9,
        salesNum: 12),
  ];
}

class Example1 extends StatefulWidget {
  Example1();

  final String title = "Filtering List";
  final String exampleUrl =
      "https://github.com/Ephenodrom/FlutterAdvancedExamples/tree/master/lib/examples/filterList";

  @override
  _Example1State createState() => _Example1State();
}

class _Example1State extends State<Example1> {
  List<Product2> initialList = Product2.product2s;
  List<Product2> currentList = [];

  //filter
  bool selfDriving = false;
  double maxPrice = 100000;
  String carType = "all";

  final controller = new TextEditingController();

  @override
  initState() {
    super.initState();
    controller.addListener(onChange);
    filterCars();
  }

  @override
  Widget build(BuildContext context) {
    filterCars();
    return Container(
      margin: EdgeInsets.only(top: 10),
      child: Column(children: [
        Text(
          "Search in any field",
          style: TextStyle(color: Colors.white70),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: TextField(controller: controller),
        ),
        SwitchListTile(
            title: Text(
              'Active ',
              style: TextStyle(color: Colors.white70),
            ),
            value: selfDriving,
            onChanged: (changed) {
              setState(() => selfDriving = changed);
            }),
        Slider(
          label: '${maxPrice.round()} \$',
          activeColor: Colors.indigoAccent,
          min: 0.0,
          max: 100000.0,
          divisions: 20,
          onChanged: (newRating) {
            setState(() => maxPrice = newRating);
          },
          value: maxPrice,
        ),
        ListTile(
            leading: Text(
              "Engine Type",
              style: TextStyle(color: Colors.white70),
            ),
            trailing: DropdownButton(
              elevation: 16,
              onChanged: (item) {
                setState(() {
                  if (item != null) carType = item.toString();
                });
              },
              hint: Text(carType),
              items: [
                DropdownMenuItem<String>(
                    child: new Text(
                      "All",
                      style: TextStyle(color: Colors.white70),
                    ),
                    value: "All"),
                DropdownMenuItem<String>(
                    child: new Text(
                      "Gas",
                      style: TextStyle(color: Colors.white70),
                    ),
                    value: "Gas"),
                DropdownMenuItem<String>(
                    child: new Text(
                      "Diesel",
                      style: TextStyle(color: Colors.white70),
                    ),
                    value: "Diesel"),
                DropdownMenuItem<String>(
                    child: new Text(
                      "Electric",
                      style: TextStyle(color: Colors.white70),
                    ),
                    value: "Electric")
              ],
            )),
        Expanded(
          child: ListView.builder(
              itemCount: currentList.length,
              itemBuilder: (BuildContext context, int index) {
                Product2 current = currentList.elementAt(index);
                return Card(
                  elevation: 4,
                  child: ListTile(
                      title: Text(current.name),
                      subtitle: Column(
                        children: [Text(current.asin), Text(current.sku)],
                      ),
                      trailing: Text(current.price.toString() + " \$"),
                      leading: SizedBox(
                          height: 100.0,
                          width: 100.0, // fixed width and height
                          child: Image.network(current.imageURL))),
                );
              }),
        ),
      ]),
    );
  }

  filterCars() {
    // Prepare lists
    List<Product2> tmp = [];
    currentList.clear();

    String name = controller.text;
    print("filter cars for name " + name);
    if (name.isEmpty) {
      tmp.addAll(initialList);
    } else {
      for (Product2 p in initialList) {
        if (p.name.toLowerCase().startsWith(name.toLowerCase())) {
          tmp.add(p);
        }
      }
    }
    currentList = tmp;

    /*   if (selfDriving) {
      tmp = [];
      print("filter cars for selfdriving " + selfDriving.toString());
      for (Product2 p in currentList) {
        if (p.selfDriving == selfDriving) {
          tmp.add(p);
        }
      }
      currentList = tmp;
    }*/

    print("filter cars for max price " + maxPrice.toString());
    tmp = [];
    for (Product2 p in currentList) {
      if (p.price < maxPrice) {
        tmp.add(p);
      }
    }
    currentList = tmp;
    /*  if (carType.toLowerCase() != "all") {
      tmp = [];
      print("filter cars for type " + carType);
      for (Product2 p in currentList) {
        if (p.type == carType.toLowerCase()) {
          tmp.add(p);
        }
      }
      currentList = tmp;
    }*/
  }

  onChange() {
    setState(() {});
  }
}
