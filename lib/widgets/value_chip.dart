import 'package:flutter/material.dart';

class ValueChip extends StatelessWidget {
  final int count;
  final String label;
  final Color backgroundColor;
  final IconData iconData;

  const ValueChip({
    Key key,
    this.count,
    this.label,
    this.backgroundColor,
    this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: Chip(
        label: Row(
          children: <Widget>[
            Text("${this.count}", style: TextStyle(color: backgroundColor, fontWeight: FontWeight.bold)),
            iconData != null ? Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(iconData, color: backgroundColor, size: 12,),
            ) : Text(" ${this.label}", style: TextStyle(color: backgroundColor),),
          ].where((c) => c != null).toList(),
        ),
      ),
    );
  }
}