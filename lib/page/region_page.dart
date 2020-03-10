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
  Future<List<RegionItem>> _futureRegions;
  DateTime latestUpdate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Regioni'),
            latestUpdate != null ? Opacity(opacity: 0.7, child: Text("Aggiornato il: ${DateFormat('dd-MM-yyyy').format(latestUpdate)}", style: TextStyle(fontSize: 12))) : null,
          ].where((c) => c!= null).toList(),
        ),
      ),
      body: Center(
        child: FutureBuilder<List<RegionItem>>(
          future: _futureRegions,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                children: [ExpansionPanelList(
                  animationDuration: Duration(milliseconds: 300),
                  expansionCallback: (int index, bool isExpanded) {
                    setState(() {
                      final regions = snapshot.data;
                      regions[index].isExpanded = !isExpanded;
                      _futureRegions = Future.value(regions);
                    });
                  },
                  children: snapshot.data.map((regionItem) => ExpansionPanel(
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
                                    label: "Totale\npositivi",
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
                                    label: "Ospedalizzati\ncon sintomi",
                                    iconData: FontAwesome5Solid.stethoscope,
                                    backgroundColor: Colors.limeAccent,
                                  ),
                                  ValueTile(
                                    count: regionItem.region.intensiveCareCount,
                                    label: "Terapia\nintensiva",
                                    iconData: FontAwesome5Solid.procedures,
                                    backgroundColor: Colors.purpleAccent,
                                  ),
                                  ValueTile(
                                    count: regionItem.region.newPositiveCount,
                                    label: "Nuovi\npositivi",
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
          },
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    final regionClient = getIt<RegionClient>();
    _futureRegions = regionClient.findAll().then((regions) {
      latestUpdate = regions[0].date;
      return regions.map((r) => RegionItem(region: r)).toList()..sort((a, b) => -a.region.positiveCount.compareTo(b.region.positiveCount));
    });
  }
}

