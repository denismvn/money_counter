import 'package:flutter/material.dart';
import 'package:money_counter/Bloc/transactions_bloc.dart';
import 'package:money_counter/Widgets/transaction_element.dart';

class TransactionList extends StatefulWidget {
  const TransactionList({super.key});

  @override
  State<TransactionList> createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
 void initState() {
    TransactionBloc().addCallBack(() {
      setState(() {
      });
    });
    super.initState();
  }
   
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder (
          shrinkWrap: true,
          itemBuilder: (context, position) => TransactionElement(
            transaction: TransactionBloc().transactions[position],
            ),
        itemCount: TransactionBloc().transactions.length
      ),
    );
  }

  @override
  void dispose() {
    TransactionBloc().deleteCallBack(callback);
    super.dispose();
  }

    Function callback = (){
    };
  }