import 'package:flutter/material.dart';
import 'package:infectify/page/region_page.dart';

import 'analytics_page.dart';

class TabsPage extends StatefulWidget {
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage> {
  int _index;
  final _widgetOptions = [
    AnalyticsPage(),
    RegionPage(),
  ];

  @override
  void initState() {
    super.initState();
    _index = 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: IndexedStack(
              index: _index,
              children: _widgetOptions
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _index,
          onTap: (int _index) {
            setState(() {
              this._index = _index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.show_chart),
              title: Text("Statistiche"),
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_module), title: Text("Regioni")),
          ],
        ),
    );
  }
}
