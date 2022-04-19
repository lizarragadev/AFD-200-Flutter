
import 'dart:convert';
import 'package:flutter/services.dart';

class _PeopleProvider {
  List<dynamic> lista = [];
  Future<List<dynamic>> cargarData() async {
    final response = await rootBundle.loadString("data/people.json");
    Map dataMap = json.decode(response);
    lista = dataMap['people'];
    return lista;
  }
}

final peopleProvider = _PeopleProvider();