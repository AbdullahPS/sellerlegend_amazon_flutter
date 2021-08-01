import 'package:flutter/material.dart';

List<Car> initialList = Car.cars;
List<Car> currentList = [];
bool selfDriving = false;
double maxPrice = 100000;
String carType = "all";
final controller = new TextEditingController();

filterCars() {
  // Prepare lists
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
    for (Car c in currentList) {
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
    for (Car c in currentList) {
      if (c.type == carType.toLowerCase()) {
        tmp.add(c);
      }
    }
    currentList = tmp;
  }
}

class Car {
  final String name;
  final String brand;
  final String type;
  final int maxSpeed;
  final int horsePower;
  final String year;
  final bool selfDriving;
  final double price;

  Car({
    required this.name,
    required this.brand,
    required this.type,
    required this.maxSpeed,
    required this.horsePower,
    required this.year,
    required this.selfDriving,
    required this.price,
  });

  static final cars = [
    new Car(
        name: "Filter",
        brand: "Alaskaprint",
        type: "gas",
        maxSpeed: 200,
        horsePower: 83,
        year: "2001",
        selfDriving: false,
        price: 2000.00),
    new Car(
        name: "Citigo",
        brand: "Sanawat",
        type: "gas",
        maxSpeed: 200,
        horsePower: 75,
        year: "2011",
        selfDriving: false,
        price: 10840.00),
    new Car(
        name: "Filter",
        brand: "Sanawat",
        type: "diesel",
        maxSpeed: 240,
        horsePower: 149,
        year: "2016",
        selfDriving: false,
        price: 32650.00),
    new Car(
        name: "Rapid",
        brand: "Skoda",
        type: "diesel",
        maxSpeed: 240,
        horsePower: 95,
        year: "2012",
        selfDriving: false,
        price: 20190.00),
    new Car(
        name: "Q2",
        brand: "Sanawat",
        type: "gas",
        maxSpeed: 280,
        horsePower: 140,
        year: "2018",
        selfDriving: false,
        price: 28000.00),
    new Car(
        name: "Model 3",
        brand: "Tesla",
        type: "electric",
        maxSpeed: 280,
        horsePower: 140,
        year: "2018",
        selfDriving: true,
        price: 35000),
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
  List<Car> initialList = Car.cars;
  List<Car> currentList = [];

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
                Car current = currentList.elementAt(index);
                return Card(
                  elevation: 4,
                  child: ListTile(
                    title: Text(current.name),
                    subtitle: Text(current.brand),
                    trailing: Text(current.price.toString() + " \$"),
                    leading: Text(current.year),
                  ),
                );
              }),
        ),
      ]),
    );
  }

  filterCars() {
    // Prepare lists
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
      for (Car c in currentList) {
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
      for (Car c in currentList) {
        if (c.type == carType.toLowerCase()) {
          tmp.add(c);
        }
      }
      currentList = tmp;
    }
  }

  onChange() {
    setState(() {});
  }
}
