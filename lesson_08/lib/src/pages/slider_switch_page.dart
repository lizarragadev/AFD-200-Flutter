import 'package:flutter/material.dart';

class SliderSwitchPage extends StatefulWidget {
  const SliderSwitchPage({Key? key}) : super(key: key);

  @override
  State<SliderSwitchPage> createState() => _SliderSwitchPageState();
}

class _SliderSwitchPageState extends State<SliderSwitchPage> {
  double _valorSlider = 50.0;
  bool _bloquearCheck = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Slider & Switch'),
        ),
        body: Column(
          children: [
            _crearSlider(),
            _crearSwitch(),
            Expanded(
                child: _crearImagen()
            )
          ],
        )
    );
  }

  Widget _crearSlider() {
    return Slider(
      value: _valorSlider,
      label: "Tamaño imagen",
      min: 1.0,
      max: 100.0,
      divisions: 20,
      onChanged: ( _bloquearCheck ) ? null : (valor) {
        setState(() {
          _valorSlider = valor;
        });
      },
    );
  }

  Widget _crearSwitch() {
    return SwitchListTile(
        title: Text("Bloquear Slider"),
        value: _bloquearCheck,
        onChanged: (valor) {
          setState(() {
            _bloquearCheck = valor;
          });
        }
    );
  }

  Widget _crearImagen() {
    return Image(
      image: AssetImage("images/logo_flutter.png"),
      fit: BoxFit.contain,
      width: (_valorSlider * 3),
    );
  }

}
