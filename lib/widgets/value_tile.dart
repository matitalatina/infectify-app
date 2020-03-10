import 'package:flutter/material.dart';

class ValueTile extends StatelessWidget {
  final int count;
  final String label;
  final Color backgroundColor;
  final IconData iconData;

  const ValueTile({
    Key key,
    @required this.count,
    @required this.label,
    @required this.backgroundColor,
    @required this.iconData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8),
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Opacity(
            opacity: 0.1,
            child: Icon(
              iconData,
              color: backgroundColor,
              size: 60,
            ),
          ),
          Column(
            children: [
              Text("${this.count}",
                  style: TextStyle(
                      color: backgroundColor, fontWeight: FontWeight.bold, fontSize: 32)),
              Text(
                "${this.label}",
                style: TextStyle(color: backgroundColor,),
                textAlign: TextAlign.center,
              ),
            ].where((c) => c != null).toList(),
          )
        ],
      ),
    );
  }
}
