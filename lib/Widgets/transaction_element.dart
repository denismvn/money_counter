import 'package:flutter/material.dart';
import 'package:money_counter/Bloc/transactions_bloc.dart';
import 'package:money_counter/Models/transaction.dart';


class TransactionElement extends StatelessWidget{
  
 final Transaction transaction;
  
  const TransactionElement ({
    super.key, 
    required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 15),
      child: Card(
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                decoration: BoxDecoration(
                color: Colors.purple,
                border: 
                Border.all(
                  width: 7,
                  color: Colors.purple,
                ),
                borderRadius: BorderRadius.circular(40),
                ),
                width: 150,
                alignment: Alignment.center,
                child: Text(
                  "${transaction.count.toStringAsFixed(2)} руб.",
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold
                  ),
                  textAlign: TextAlign.center,
                )
              ),
              const VerticalDivider(),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(transaction.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16),),
                  const Divider(
                    height: 5,
                  ),
                  Text(transaction.dateString,
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 12)),
                  
              ]),
              Expanded(
                child: Container(),
                ),
              IconButton(
                onPressed: (){
                  TransactionBloc().deleteTransaction(transaction);
                }, 
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,)),
            ],
          ),
        ),
      ),
    );
  }
}