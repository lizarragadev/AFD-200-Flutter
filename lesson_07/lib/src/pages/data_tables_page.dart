import 'package:flutter/material.dart';

class DataTablePage extends StatelessWidget {
  const DataTablePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Table"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 10,
            dataRowColor: MaterialStateColor.resolveWith((states) => Colors.green),
            headingRowColor: MaterialStateColor.resolveWith((states) => Colors.amber),
            columns: const [
              DataColumn( label: Text("Columna 1")),
              DataColumn( label: Text("Columna 2")),
              DataColumn( label: Text("Columna 3")),
              DataColumn( label: Text("Columna 4")),
            ],
            rows: const [
              DataRow(
                  cells: [
                    DataCell(Text("Valor 1")),
                    DataCell(Text("Valor 2")),
                    DataCell(Text("Valor 3")),
                    DataCell(Text("Valor 4")),
                  ]
              ),
              DataRow(
                  cells: [
                    DataCell(Text("Valor 5")),
                    DataCell(Text("Valor 6")),
                    DataCell(Text("Valor 7")),
                    DataCell(Text("Valor 8")),
                  ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
