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
      child: Container(
        width: 140,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("${this.count} ",
                    style: TextStyle(
                        color: backgroundColor, fontWeight: FontWeight.bold, fontSize: 32)),
                Icon(
                  iconData,
                  color: backgroundColor,
                  size: 30,
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 8),
              child: Text(
                "${this.label}",
                style: TextStyle(color: backgroundColor,),
                textAlign: TextAlign.center,
              ),
            ),
          ].where((c) => c != null).toList(),
        ),
      ),
    );
  }
}
