
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ChartsElement extends StatefulWidget {

  String title;
  double count;
  double procentCount;

  ChartsElement({
    super.key,
    required this.title,
    required this.count,
    required this.procentCount,
  });

  @override
  State<ChartsElement> createState() => _ChartsElementState();
}

class _ChartsElementState extends State<ChartsElement> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          FittedBox
          (child: Text("${widget.count} руб")), 
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: 10,
                height: 60,
                child:
                  Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        border: Border.all(
                          color: const Color.fromARGB(255, 214, 214, 214),
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    FractionallySizedBox(
                      heightFactor: widget.procentCount,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                  ],
              
                ),
              ),
            ),
          ),
          Text(widget.title),
        ],
      ),
    );
  }
}