import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:infectify/client/region.dart';
import 'package:infectify/model/region.dart';
import 'package:infectify/widgets/value_chip.dart';
import 'package:infectify/widgets/value_tile.dart';
import 'package:intl/intl.dart';

import '../locator.dart';

class RegionPage extends StatefulWidget {
  @override
  _RegionPageState createState() => _RegionPageState();
}

class RegionItem {

  RegionItem({
    this.isExpanded = false,
    this.region,
  });

  Region region;
  bool isExpanded;
}

class _RegionPageState extends State<RegionPage> {
  List<RegionItem> _futureRegions;
  DateTime latestUpdate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(icon: Icon(Icons.refresh), onPressed: () {
            setState(() {
              _futureRegions = null;
            });
            loadRegions();
          })
        ],
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Regioni'),
            latestUpdate != null ? Opacity(opacity: 0.7, child: Text("Aggiornato il: ${DateFormat('dd-MM-yyyy').format(latestUpdate)}", style: TextStyle(fontSize: 12))) : null,
          ].where((c) => c!= null).toList(),
        ),
      ),
      body: Center(
        child: getBody(context)
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    loadRegions();
  }

  Future<void> loadRegions() {
    final regionClient = getIt<RegionClient>();
    return regionClient.findAll().then((regions) {
      setState(() {
        latestUpdate = regions[0].date;
        _futureRegions = regions.map((r) => RegionItem(region: r)).toList()..sort((a, b) => -a.region.positiveCount.compareTo(b.region.positiveCount));
      });
    });
  }

  Widget getBody(BuildContext context) {
    if (_futureRegions != null) {
      return ListView(
          children: [ExpansionPanelList(
            animationDuration: Duration(milliseconds: 300),
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                final regions = _futureRegions;
                regions[index].isExpanded = !isExpanded;
                _futureRegions = regions;
              });
            },
            children: _futureRegions.map((regionItem) => ExpansionPanel(
              headerBuilder: (context, isExpanded) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(regionItem.region.name),
                      !isExpanded ? Row(
                        children: <Widget>[
                          ValueChip(
                            count: regionItem.region.positiveCount,
                            label: "positivi",
                            iconData: FontAwesome5.frown,
                            backgroundColor: Colors.amber,
                          ),
                          ValueChip(
                            count: regionItem.region.healedCount,
                            label: "guariti",
                            backgroundColor: Colors.green,
                            iconData: FontAwesome5.check_circle,
                          ),
                          ValueChip(
                            count: regionItem.region.deathCount,
                            label: "deceduti",
                            iconData: FontAwesome5Solid.skull_crossbones,
                            backgroundColor: Colors.grey,
                          ),
                        ],
                      ): Container()
                    ],
                  ),
                );
              },
              body: Padding(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
                child: Row(
                  children: [
                    Expanded(
                      child: Wrap(
                        children: [
                          ValueTile(
                            count: regionItem.region.positiveCount,
                            label: "Positivi",
                            iconData: FontAwesome5.frown,
                            backgroundColor: Colors.amber,
                          ),
                          ValueTile(
                            count: regionItem.region.healedCount,
                            label: "Guariti",
                            backgroundColor: Colors.green,
                            iconData: FontAwesome5.check_circle,
                          ),
                          ValueTile(
                            count: regionItem.region.deathCount,
                            label: "Deceduti",
                            iconData: FontAwesome5Solid.skull_crossbones,
                            backgroundColor: Colors.grey,
                          ),
                          ValueTile(
                            count: regionItem.region.positiveCount,
                            label: "Totale positivi",
                            iconData: FontAwesome5.user,
                            backgroundColor: Colors.red,
                          ),
                          ValueTile(
                            count: regionItem.region.hospitalizedCount,
                            label: "Ospedalizzati",
                            iconData: FontAwesome5.hospital,
                            backgroundColor: Colors.cyanAccent,
                          ),
                          ValueTile(
                            count: regionItem.region.hospitalizedWithSymptomsCount,
                            label: "Ospedalizzati con sintomi",
                            iconData: FontAwesome5Solid.stethoscope,
                            backgroundColor: Colors.limeAccent,
                          ),
                          ValueTile(
                            count: regionItem.region.intensiveCareCount,
                            label: "Terapia intensiva",
                            iconData: FontAwesome5Solid.procedures,
                            backgroundColor: Colors.purpleAccent,
                          ),
                          ValueTile(
                            count: regionItem.region.quarantineAtHomeCount,
                            label: "Quarantena a casa",
                            iconData: FontAwesome5Solid.home,
                            backgroundColor: Colors.blue,
                          ),
                          ValueTile(
                            count: regionItem.region.newPositiveCount,
                            label: "Nuovi positivi",
                            iconData: FontAwesome5Solid.user_plus,
                            backgroundColor: Colors.yellowAccent,
                          ),
                        ].map((w) => Padding(padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4),child: w,)).toList(),
                      ),
                    )
                  ],
                ),
              ),
              isExpanded: regionItem.isExpanded,
            )).toList(),
          ),
          ]
      );
    }
    return CircularProgressIndicator();
  }


}

