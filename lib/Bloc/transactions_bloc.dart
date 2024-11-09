import 'package:money_counter/Models/transaction.dart';

class TransactionBloc {
  static TransactionBloc? _instance;

  TransactionBloc._internal();

  factory TransactionBloc(){
    
    _instance ??= TransactionBloc._internal();

    return _instance!;
  }
  
  final  List<Transaction> _transactions = [
    Transaction(count: 2500, name: "Кроссовки", date: DateTime.now()),
    Transaction(count: 5000, name: "Куртка", date: DateTime.now()),
    Transaction(count: 50, name: "Вода", date: DateTime.now()),
    Transaction(count: 2500000, name: "Машина", date: DateTime.now()),
    Transaction(count: 20000, name: "ХВОХ", date: DateTime.now())
  ];

  final List<Function> _callBacks = [];
  List<Transaction> get transactions => _transactions;

  void addTransaction (Transaction transaction) { 
    _transactions.add(transaction);
      for (var element in _callBacks) {
         element();
    }
  }

  bool deleteTransaction (Transaction transaction) {  
   bool result = _transactions.remove(transaction);
     for (var element in _callBacks) {
    element();
    }

    return result;
  }

 void addCallBack (Function callback) => _callBacks.add(callback);

  bool deleteCallBack (Function callback) => _callBacks.remove(callback);
}