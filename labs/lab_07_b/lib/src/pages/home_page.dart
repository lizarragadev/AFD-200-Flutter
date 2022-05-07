import 'package:flutter/material.dart';
import 'package:lab_07_b/src/models/car_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var carData = [
    Car(carMake: "Honda", model: "2021", price: 35000.0),
    Car(carMake: "Toyota", model: "2011", price: 6000.0),
    Car(carMake: "BMW", model: "2010", price: 9000.0),
  ];

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text('Lab 07-b'),
        ),
        body: Center(
          child: DataTable(
            sortAscending: false,
            sortColumnIndex: 0,
            columns: [
              DataColumn(
                  label: const Text("Car Make"),
                  numeric: false,
                  onSort: (i, b) {
                    setState(() {
                      carData.sort((a, b) => a.carMake!.compareTo(b.carMake!));
                    });
                  }
              ),
              DataColumn(
                  label: const Text("Model"),
                  numeric: false,
                  onSort: (i, b) {
                    setState(() {
                      carData.sort((a, b) => a.model!.compareTo(b.model!));
                    });
                  }
              ),
              DataColumn(
                  label: const Text("Price"),
                  numeric: true,
                  onSort: (i, b) {
                    setState(() {
                      carData.sort((a, b) => a.price!.compareTo(b.price!));
                    });
                  }
              ),
            ],
            rows: carData.map((x) =>
                DataRow(
                  cells: [
                    DataCell(Text("${x.carMake}")),
                    DataCell(Text("${x.model}")),
                    DataCell(Text("${x.price}")),
                  ]
                )
            ).toList(),
          ),
        )
    );;
  }
}

