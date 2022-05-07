import 'package:flutter/material.dart';

class SelectableTextPage extends StatefulWidget {
  const SelectableTextPage({Key? key}) : super(key: key);

  @override
  State<SelectableTextPage> createState() => _SelectableTextPageState();
}

class _SelectableTextPageState extends State<SelectableTextPage> {
  String texto = "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).";
  String selectedText = "";
  int posInicial = 0 ;
  int posFinal = 0 ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Selectable Text"),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              SelectableText(
                texto,
                textAlign: TextAlign.justify,
                showCursor: true,
                cursorWidth: 5,
                onTap: () { print("CLick en selectable text"); },
                onSelectionChanged: (TextSelection text, cause) {
                  setState(() {
                    posInicial = text.start;
                    posFinal = text.end;
                    selectedText = texto.substring(posInicial, posFinal);
                  });
                },
              ),
              SizedBox(height: 20,),
              Text("Texto seleccionado: ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
              SizedBox(height: 20,),
              Text(selectedText)
            ],
          )
        ),
    );
  }
}
