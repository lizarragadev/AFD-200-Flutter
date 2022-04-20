import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class CheckBoxRadioButtonPage extends StatefulWidget {
  const CheckBoxRadioButtonPage({Key? key}) : super(key: key);

  @override
  State<CheckBoxRadioButtonPage> createState() => _CheckBoxRadioButtonPageState();
}

class _CheckBoxRadioButtonPageState extends State<CheckBoxRadioButtonPage> {
  final _elementosCheckbox = ["Lunes", "Martes", "Miercoles", "Jueves", "Viernes", "Sabado", "Domingo"];
  List<String> _checksSeleccionados = [];

  final _elementosRadioButton = ["0 a 18", "19 a 30", "31 a 60", "Arriba de 61"];
  String _radioSeleccionado = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CheckBox & RadioButtons'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Seleccione los dias disponibles"),
              CheckboxGroup(
                checkColor: Colors.black,
                activeColor: Colors.redAccent,
                labels: _elementosCheckbox,
                onSelected: (List<String> checked) {
                  setState(() {
                    _checksSeleccionados = checked;
                    print(_checksSeleccionados);
                  });
                },
              ),
              Text("Seleccione su rango de edad"),
              RadioButtonGroup(
                labels: _elementosRadioButton,
                activeColor: Colors.greenAccent,
                onSelected: (selected) {
                    setState(() {
                      _radioSeleccionado = selected;
                      print(_radioSeleccionado);
                    });
                },
              )
            ],
          ),
        )
    );
  }

}
