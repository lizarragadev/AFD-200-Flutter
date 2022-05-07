import 'package:flutter/material.dart';

class Screen1 extends StatefulWidget {
  const Screen1({Key? key}) : super(key: key);

  @override
  State<Screen1> createState() => _Screen1State();
}

class _Screen1State extends State<Screen1> {

  var carData = <Car>[
    Car(carMake: "Honda", model: "2021", price: 35000.0),
    Car(carMake: "Toyota", model: "2011", price: 6000.0),
    Car(carMake: "BMW", model: "2010", price: 9000.0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: DataTable(
            sortColumnIndex: 2,
            sortAscending: false,
            columns: <DataColumn>[
              DataColumn(
                label: const Text('Car Make'),
                numeric: false,
                onSort: (i, b) {
                  setState(() {
                      carData.sort((a, b) => a.carMake.compareTo(b.carMake));
                    },
                  );
                },
              ),
              DataColumn(
                label: const Text("Model"),
                numeric: false,
                onSort: (i, b) {
                  setState(() {
                    carData.sort((a, b) => a.model.compareTo(b.model));
                    },
                  );
                },
              ),
              DataColumn(
                label: const Text('Price'),
                numeric: true,
                onSort: (i, b) {
                  setState(() {
                      carData.sort((a, b) => a.price.compareTo(b.price));
                    },
                  );
                },
              ),
            ],
            rows: carData
                .map(
                  (x) => DataRow(
                cells: [
                  DataCell(Text(x.carMake)),
                  DataCell(Text(x.model)),
                  DataCell(Text((x.price).toString())),
                ],
              ),
            )
                .toList()),
      ),
    );
  }
}

class Car {
  String carMake;
  String model;
  double price;

  Car({required this.carMake, required this.model, required this.price});
}
