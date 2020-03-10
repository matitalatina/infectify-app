class LatLon {
  final double lat;
  final double lon;

  LatLon(this.lat, this.lon);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is LatLon &&
              runtimeType == other.runtimeType &&
              lat == other.lat &&
              lon == other.lon;

  @override
  int get hashCode =>
      lat.hashCode ^
      lon.hashCode;
}
class Region {
  final DateTime date;
  final String state;
  final int code;
  final String name;
  final int hospitalizedWithSymptomsCount;
  final int intensiveCareCount;
  final int hospitalizedCount;
  final int quarantineAtHomeCount;
  final int positiveCount;
  final int newPositiveCount;
  final int healedCount;
  final int deathCount;
  final int caseCount;
  final int testCount;
  final LatLon location;

  Region({this.code, this.name, this.hospitalizedWithSymptomsCount, this.intensiveCareCount, this.hospitalizedCount, this.quarantineAtHomeCount, this.positiveCount, this.newPositiveCount, this.healedCount, this.deathCount, this.caseCount, this.testCount, this.location, this.date, this.state});

  static Region fromJson(Map<String, dynamic> json) {
    final coordinates = json['location']['coordinates'];
    return Region(
        date: DateTime.parse(json['date']),
        state: json['state'],
        code: json['code'],
        name: json['name'],
        hospitalizedWithSymptomsCount: json['hospitalizedWithSymptomsCount'],
        intensiveCareCount: json['intensiveCareCount'],
        hospitalizedCount: json['hospitalizedCount'],
        quarantineAtHomeCount: json['quarantineAtHomeCount'],
        positiveCount: json['positiveCount'],
        newPositiveCount: json['newPositiveCount'],
        healedCount: json['healedCount'],
        deathCount: json['deathCount'],
        caseCount: json['caseCount'],
        testCount: json['testCount'],
        location: LatLon(coordinates[1], coordinates[0])
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Region &&
              runtimeType == other.runtimeType &&
              date == other.date &&
              state == other.state &&
              code == other.code &&
              name == other.name &&
              hospitalizedWithSymptomsCount ==
                  other.hospitalizedWithSymptomsCount &&
              intensiveCareCount == other.intensiveCareCount &&
              hospitalizedCount == other.hospitalizedCount &&
              quarantineAtHomeCount == other.quarantineAtHomeCount &&
              positiveCount == other.positiveCount &&
              newPositiveCount == other.newPositiveCount &&
              healedCount == other.healedCount &&
              deathCount == other.deathCount &&
              caseCount == other.caseCount &&
              testCount == other.testCount &&
              location == other.location;

  @override
  int get hashCode =>
      date.hashCode ^
      state.hashCode ^
      code.hashCode ^
      name.hashCode ^
      hospitalizedWithSymptomsCount.hashCode ^
      intensiveCareCount.hashCode ^
      hospitalizedCount.hashCode ^
      quarantineAtHomeCount.hashCode ^
      positiveCount.hashCode ^
      newPositiveCount.hashCode ^
      healedCount.hashCode ^
      deathCount.hashCode ^
      caseCount.hashCode ^
      testCount.hashCode ^
      location.hashCode;
}