import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:money_counter/Bloc/transactions_bloc.dart';
import 'package:money_counter/Widgets/charts_element.dart';


class ChartsList extends StatefulWidget {
  const ChartsList({super.key});

  @override
  State<ChartsList> createState() => _ChartsListState();
}

class _ChartsListState extends State<ChartsList> {
  @override
  void initState() {
    super.initState();

    initializeDateFormatting();
    TransactionBloc().addCallBack((){
      setState(() {});
      }
    );
  }
  

List<Map<String, dynamic>> get groupedTransactionsValues => List.generate(7, 
  (index) {
    final weekDay = DateTime.now().subtract(Duration(days: index));

    var totalSum = 0.0;
    for (var transaction in TransactionBloc().transactions) {
      if (transaction.date.day == weekDay.day && 
        transaction.date.month == weekDay.month &&
        transaction.date.year == weekDay.year
      ) {
        totalSum += transaction.count;
      }
     }
    
    return {
    "day": DateFormat.E("ru_RU").format(weekDay),
    "count": totalSum,
      };
    }).reversed.toList();
    
    double get totalSpending => groupedTransactionsValues.fold(
      0.0,
      (sum, element) => sum += element["count"]
    );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: SizedBox(
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children:
               groupedTransactionsValues.map((date) => 
               ChartsElement(
                title: date ['day'], 
                count: date ['count'], 
                procentCount: totalSpending == 0 ? 0.0: date['count'] / totalSpending
                )
              ).toList(),
            ),
          ),
        ),
      ),
    );
  }
}