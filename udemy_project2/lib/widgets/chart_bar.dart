import 'package:flutter/material.dart';

class ChartBar extends StatefulWidget {
  final String label;
  final double spendAmount;
  final double spendingPercent;
  ChartBar(
      {required this.label,
      required this.spendAmount,
      required this.spendingPercent});

  @override
  State<ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context, constraints) => Column(
              children: <Widget>[
                Container(
                  height: constraints.maxHeight * 0.15,
                  child: FittedBox(
                    child: Text("\$${widget.spendAmount.toStringAsFixed(2)}"),
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Container(
                  height: constraints.maxHeight * 0.6,
                  width: 10,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey, width: .0),
                          color: Color.fromRGBO(220, 220, 220, 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      FractionallySizedBox(
                        heightFactor: widget.spendingPercent,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: constraints.maxHeight * 0.05,
                ),
                Container(
                  height: constraints.maxHeight * 0.15,
                  child: Text(widget.label),
                ),
              ],
            ));
  }
}
