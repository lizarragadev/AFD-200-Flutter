import 'package:flutter/material.dart';

class PickersDialogPage extends StatefulWidget {
  const PickersDialogPage({Key? key}) : super(key: key);

  @override
  State<PickersDialogPage> createState() => _PickersDialogPageState();
}

class _PickersDialogPageState extends State<PickersDialogPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pickers & Dialogs'),
        ),
        body: Text("Hola")
    );
  }
}











class CustomDialogBox extends StatefulWidget {
  final String? title, descriptions, text;
  final Image? img;

  const CustomDialogBox({Key? key, this.title, this.descriptions, this.text, this.img}) : super(key: key);

  @override
  _CustomDialogBoxState createState() => _CustomDialogBoxState();
}

class _CustomDialogBoxState extends State<CustomDialogBox> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }
  contentBox(context){
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 20,top: 65, right: 20,bottom: 20),
          margin: const EdgeInsets.only(top: 45),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                    color: Colors.black,
                    offset: Offset(0, 3),
                    blurRadius: 5
                ),
              ]
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(widget.title!,style: const TextStyle(fontSize: 22,fontWeight: FontWeight.w600),),
              SizedBox(height: 15,),
              Text(widget.descriptions!,style: const TextStyle(fontSize: 14),textAlign: TextAlign.center,),
              SizedBox(height: 22,),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text(widget.text!,style: const TextStyle(fontSize: 18),)),
              ),
            ],
          ),
        ),
        Positioned(
          left: 20,
          right: 20,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 45,
            child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(45)),
                child: Image.asset("images/profile.png")
            ),
          ),
        ),
      ],
    );
  }
}