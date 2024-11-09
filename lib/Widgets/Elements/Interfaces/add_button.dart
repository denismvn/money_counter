import 'package:flutter/material.dart';
import 'package:money_counter/Bloc/transactions_bloc.dart';
import '../../../Models/transaction.dart';

abstract class AddButton  extends StatelessWidget {
  const AddButton({super.key});

  void onPressed (
    BuildContext context, 
    DateTime? transactionDate, 
    TextEditingController countEditController, 
    TextEditingController titleEditController,
    ) {
    if (double.tryParse(countEditController.text) == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
         content: Text("Некорректное число"),
        )
      );
    }  

    TransactionBloc().addTransaction(
    Transaction(
      count: double.parse(countEditController.text),
      name: titleEditController.text, 
      date: transactionDate ?? DateTime.now()
      ),
    );
    Navigator.pop(context);
  }
}