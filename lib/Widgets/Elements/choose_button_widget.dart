import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_counter/Widgets/Elements/Interfaces/choose_button.dart';

class IOSChooseButtonWidget extends ChooseButton {
  final Function (DateTime?) callBack;
  
  const IOSChooseButtonWidget(this.callBack, {super.key});

  @override
  Widget build(BuildContext context) {
   return CupertinoButton(
    child: const Text("Выбрать"), 
    onPressed: (){
      getDatePicker(context, callBack);
    }
   );
  }

  @override
    Future getDatePicker(
      BuildContext context, 
      Function(DateTime?) callBack) 
      async {
      return showCupertinoModalPopup(
        context: context, 
        builder: (_) => Container(
          height: 500,
          color: const Color.fromARGB(255, 255, 255, 255),
          child:  Column(
            children: [
              SizedBox(
                height: 400,
                child: CupertinoDatePicker(
                    mode: CupertinoDatePickerMode.date,
                    initialDateTime: DateTime.now(),
                    minimumDate: DateTime(1900),
                    maximumDate: DateTime.now(),
                    use24hFormat: true,
                    onDateTimeChanged: (val) {
                      callBack(val);
                    },
                 ),
                ),
              Builder(
                builder: (BuildContext context2) => CupertinoButton(
                  child: const Text('OK'), 
                  onPressed: () => Navigator.of(context2).pop(),
                ),
                 
              )
            ],
          ),
        ), 
      )
    ;
  }
}


class AndroidChooseButtonWidget extends ChooseButton {
  final Function (DateTime?) callBack; 

  const AndroidChooseButtonWidget(this.callBack, {super.key});

  @override
  Widget build(BuildContext context) {
   return TextButton(
    child: const Text('Выбрать'), 
    onPressed: (){
      getDatePicker(context, callBack);
    },
    )
 ;}
 
  @override
  Future getDatePicker(
    BuildContext context,
    Function(DateTime?) callBack) async {
      showDatePicker(
        context: context, 
        initialDate: DateTime.now(),
        firstDate: DateTime(1980), 
        lastDate: DateTime.now(),
        )
      .then((value) {
        callBack(value);
      }
    );
  }
}
