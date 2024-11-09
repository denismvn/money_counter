import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:money_counter/Widgets/Factory/Classes/config.dart';


class AddingForm extends StatefulWidget {
  const AddingForm({super.key});

  @override
  State<AddingForm> createState() => _AddingFormState();
}

class _AddingFormState extends State<AddingForm> {
  final TextEditingController _titleEditController = TextEditingController();
  final TextEditingController _countEditController = TextEditingController();
  DateTime? transactionDate;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(
          left: 20,
          right: 20,
          top: 10,
          bottom: MediaQuery.of(context).viewInsets.bottom + (Platform.isIOS ? 30 : 30),
          ),
        child: Column(
          crossAxisAlignment: Config().getFactory!.getAddButtonPosition(),
          children: [
            TextField(
              controller: _titleEditController,
              decoration: const InputDecoration(
                labelText: "Название транзакции", 
                labelStyle: TextStyle( 
                  color: Colors.grey)
                ),
              ),
            const Divider(
              color: Colors.transparent,),
            TextField(
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true),
              controller: _countEditController,
              decoration: const InputDecoration(
                labelText: "Стоимость", 
                labelStyle: TextStyle(
                  color: Colors.grey)
                  ),
                ),
            const Divider(
              color: Colors.transparent,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Дата транзакции:  "),
                transactionDate == null
               ?  Config().getFactory!.getChooseButton((dateTime) {
                setState(() {
                  transactionDate = dateTime; 
                });})
                  : Text(DateFormat('dd.MM.yyyy').format(transactionDate!)
                  ),
              ],
            ),
            const Divider(
              color: Colors.transparent,),
             Config().getFactory!.getAddButton(
              transactionDate,
              _countEditController,
              _titleEditController,
             )
        ]),
      );
  }
}