import 'package:flutter/material.dart';
import 'package:money_counter/Widgets/Factory/Classes/config.dart';
import 'package:money_counter/Widgets/charts_list.dart';
import 'package:money_counter/Widgets/transactions_list.dart';

void main() {
  runApp(const MyApp());
  // Приоритет портреной ориентации
  // SystemChrome.setPreferredOrientations([
  //   DeviceOrientation.portraitUp,
  // ]).then((_) {
  //   runApp(const MyApp());
  // });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
      theme: ThemeData(
        colorScheme: ThemeData().colorScheme.copyWith(
          primary: Colors.purple,
          secondary: Colors.amber[200],
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
   const pageBody = SafeArea(
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ChartsList(),
        TransactionList(),
      ],
    ));
    return Config().getFactory!.getPageScaffold(pageBody);
  }
}

