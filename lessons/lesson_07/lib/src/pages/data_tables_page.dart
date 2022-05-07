import 'package:flutter/material.dart';

class DataTablePage extends StatelessWidget {
  int numColumnas = 10;
  int numFilas = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Table"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            columnSpacing: 10,
            dataRowColor: MaterialStateColor.resolveWith((states) => Colors.green),
            headingRowColor: MaterialStateColor.resolveWith((states) => Colors.amber),
            columns: _addHeaders(),
            rows: _addRows(),
          ),
        ),
      ),
    );
  }

  List<DataColumn> _addHeaders() {
    List<DataColumn> lista = [];
    for(int i = 1; i<= numColumnas; i++) {
      lista.add(DataColumn(label: Text("Columna $i")));
    }
    return lista;
  }

  List<DataRow> _addRows() {
    List<DataRow> lista = [];
    for(int i = 1; i<= numFilas; i++) {
      List<DataCell> listaCelda = [];
      for(int j = 1; j <= numColumnas; j++) {
        listaCelda.add(DataCell(Text("Celda($i, $j)")));
      }
      lista.add(DataRow(cells: listaCelda));
    }
    return lista;
  }
}
