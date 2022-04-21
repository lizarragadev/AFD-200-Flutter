import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Android ATC Hotel"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          children: [
            _crearCardImagen(),
            _crearCheckInCheckOut("Fecha check-in", checkInDate, CHECK_IN),
            _crearCheckInCheckOut("Fecha check-out", checkOutDate, CHECK_OUT),
            _crearSliderAdultos(),
            _crearSliderNinos(),
            SizedBox(height: 10,),
            Text("Extras", style: _textStyleTitle,),
            _crearCheckboxExtras(),
            Text("Tipo de vista", style: _textStyleTitle,),
            _crearRadioVistas(),
            SizedBox(height: 30,),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.orangeAccent
                ),
                onPressed: () {
                  Navigator.pushNamed(context, "/roomPage");
                },
                child: Text("Ver Habitaciones",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
            )
          ],
        ),
      ),
    );
  }

  Widget _crearRadioVistas() {
    return RadioButtonGroup(
        labels: [
          "Vista a la ciudad",
          "Vista al lago"
        ],
        onSelected: (selected) {
          print(selected);
        },
    );
  }

  Widget _crearCheckboxExtras() {
    return CheckboxGroup(
      labels: [
        "Desayuno (20 Bs/dia)",
        "Internet WiFi (30 Bs/dia)",
        "Parqueo (25 Bs/dia)",
        "Piscina (50 Bs/dia)",
      ],
      onSelected: (List<String> list) {
        print(list);
      },
    );
  }

  int numeroDeAdultos = 0;
  int numeroDeNinos = 0;

  Widget _crearSliderAdultos() {
    return Row(
      children: [
        Text("Adultos  $numeroDeAdultos", style: _textStyleTitle,),
        Expanded(
            child: Slider(
              value: numeroDeAdultos.toDouble(),
              min: 0,
              max: 6,
              divisions: 6,
              label: "$numeroDeAdultos adultos",
              onChanged: (nuevoValor) {
                setState(() {
                  numeroDeAdultos = nuevoValor.toInt();
                });
              },
            )
        )
      ],
    );
  }

  Widget _crearSliderNinos() {
    return Row(
      children: [
        Text("Niños  $numeroDeNinos", style: _textStyleTitle,),
        Expanded(
            child: Slider(
              value: numeroDeNinos.toDouble(),
              min: 0,
              max: 6,
              divisions: 6,
              label: "$numeroDeNinos niños",
              onChanged: (nuevoValor) {
                setState(() {
                  numeroDeNinos = nuevoValor.toInt();
                });
              },
            )
        )
      ],
    );
  }


  final _textStyleTitle = TextStyle(fontSize: 17.0, color: Colors.deepOrange, fontWeight: FontWeight.bold);
  final _textStyleContent = TextStyle(fontSize: 17.0, color: Colors.blue);

  DateTime checkInDate = DateTime.now();
  DateTime checkOutDate = DateTime.now();
  final int CHECK_IN = 1;
  final int CHECK_OUT = 2;

  Future<void> _selectDate(context, type) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: (type == CHECK_IN) ? checkInDate : checkOutDate,
        firstDate: DateTime(2022),
        lastDate: DateTime(2023)
    );
    if(picked != null && picked != checkInDate && picked != checkOutDate) {
      setState(() {
        if(type == CHECK_IN)
          checkInDate = picked;
        else
          checkOutDate = picked;
      });
    }
  }

  Widget _crearCheckInCheckOut(titulo, check, tipo) {
    return Row(
      children: [
        Text(titulo, style: _textStyleTitle,),
        SizedBox(width: 10.0,),
        Text("${check.year}/${check.month}/${check.day}", style: _textStyleContent,),
        IconButton(
            onPressed: () { _selectDate(context, tipo); },
            icon: Icon(Icons.date_range, color: Colors.deepOrange,)
        )
      ],
    );
  }

  Widget _crearCardImagen() {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0)
      ),
      elevation: 6,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15.0),
        child: Image(
          image: AssetImage("images/entrance.jpg"),
        ),
      ),
    );
  }


}












