import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_counter/Widgets/Elements/Interfaces/add_button.dart';

class IOSAddButtonWidget extends AddButton {
    final DateTime? transactionDate; 
    final TextEditingController countEditController;
    final TextEditingController titleEditController;

  const IOSAddButtonWidget({
    super.key,
    this.transactionDate,
    required this.countEditController,
    required this.titleEditController,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      color: Theme.of(context).primaryColor,
      child: const Text("Добавить"), 
      onPressed: (){
        super.onPressed(
        context, 
        transactionDate, 
        countEditController, 
        titleEditController); 
      }
    );
  }
}

class AndroidAddButtonWidget extends AddButton  {
    final DateTime? transactionDate; 
    final TextEditingController countEditController;
    final TextEditingController titleEditController;

  const AndroidAddButtonWidget({  
    super.key,
    this.transactionDate,
    required this.countEditController,
    required this.titleEditController,});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
            child: const Text("Добавить"),
            onPressed: () {
              super.onPressed(
                context, 
                transactionDate, 
                countEditController, 
                titleEditController);
            }, 
          );


  }
}