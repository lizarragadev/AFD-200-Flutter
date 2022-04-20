import 'package:flutter/material.dart';

class PickersDialogPage extends StatefulWidget {
  const PickersDialogPage({Key? key}) : super(key: key);

  @override
  State<PickersDialogPage> createState() => _PickersDialogPageState();
}

class _PickersDialogPageState extends State<PickersDialogPage> {
  DateTime date = DateTime.now();
  DateTime? pickerDate;

  bool _elegirFechas(DateTime day) {
    if((day.isAfter(DateTime.now().subtract(Duration(days: 5)))) &&
        (day.isBefore(DateTime.now().add(Duration(days: 10))))) {
      return true;
    }
    return false;
  }

  Future<void> _selectDate(context) async {
    pickerDate = await showDatePicker(
        context: context,
        initialDate: date,
        firstDate: DateTime(2020),
        lastDate: DateTime(2025),
        selectableDayPredicate: _elegirFechas
    );
    if(pickerDate != null && pickerDate != date) {
      setState(() {
        date = pickerDate!;
        print(date);
      });
    }
  }

  TimeOfDay time = TimeOfDay.now();
  TimeOfDay? pickedTime;

  Future<void> _selectHour(context) async {
    pickedTime = await showTimePicker(
        context: context,
        initialTime: time
    );
    setState(() {
      time = pickedTime!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pickers & Dialogs'),
        ),
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Seleccione una fecha: "),
                  IconButton(
                      onPressed: () { 
                        _selectDate(context);
                      },
                      icon: Icon(Icons.date_range)
                  )
                ],
              ),
              Text("${ date.day }/${ date.month }/${ date.year}",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
              SizedBox(height: 30,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Seleccione una hora: "),
                  IconButton(
                      onPressed: () {
                        _selectHour(context);
                      },
                      icon: Icon(Icons.watch_later_outlined)
                  )
                ],
              ),
              Text("${ time.hour }:${ time.minute }",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),
            ],
          ),
        )
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