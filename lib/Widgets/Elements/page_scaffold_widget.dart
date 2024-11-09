import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:money_counter/Widgets/Elements/add_transaction_widget.dart';
import 'package:money_counter/Widgets/Elements/Interfaces/page_scaffold.dart';


class PageIOSScaffoldWidget extends PageScaffold{
  final Widget pageBody;

  const PageIOSScaffoldWidget({super.key, required this.pageBody});
  
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold( 
      navigationBar: CupertinoNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        middle: const Text(
          "Финансовый ассистент",
          style: TextStyle(
            color: Colors.white
          ),),
        trailing: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IOSAddTransactionWidget(),
          ], 
        ),
      ), 
      child: pageBody,
    );
  }
}

class PageAndroidScaffoldWidget extends PageScaffold{
  final Widget pageBody;
  
  const PageAndroidScaffoldWidget({super.key, required this.pageBody});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( 
        backgroundColor: Colors.purple[300],
        titleTextStyle: const TextStyle(color: Colors.white, fontSize: 20),
        title: const Text("Финансовый ассистент"),
      ),
      body: pageBody,
      floatingActionButton: const AndroidAddTransactionWidget(),
    );
  }
}



      /*

  
}*/